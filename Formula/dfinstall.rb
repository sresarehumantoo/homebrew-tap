class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.1/dfinstall_2.4.1_darwin_arm64.tar.gz"
      sha256 "a316e45724c90bb556433804e6cf65ea1de50e0e5f5ec19aada64ecf5cb67676"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.1/dfinstall_2.4.1_darwin_amd64.tar.gz"
      sha256 "4f30e4cdff62dc8ae5fcbf72ef6fb9b9361c85d34c673bee8aba3df45b386f34"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.1/dfinstall_2.4.1_linux_arm64.tar.gz"
      sha256 "ec03be8f3dcff9d3952adc120ffd49a32ccd4c47bdc113bb486ae6e2bfa9e20f"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.1/dfinstall_2.4.1_linux_amd64.tar.gz"
      sha256 "d24cd2b11937ee536a808b96e6d7a3e6478c572f5a8b17bd0f800bb98be53f2d"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.1/dfinstall-content_2.4.1.tar.gz"
    sha256 "1b82a986b564b1b10da91d81871e6e03da44008450904bc37770e8e575af3f2d"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
