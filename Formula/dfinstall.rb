class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.7.1/dfinstall_2.7.1_darwin_arm64.tar.gz"
      sha256 "2cb95c1ad97cea3f226e0b1a34d857da5c1d79cf76a7b151fdd1657527110a3d"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.7.1/dfinstall_2.7.1_darwin_amd64.tar.gz"
      sha256 "0a3f7cc5d0b784490e699383f4f4426ab0341fc52193c0f23edfcc0fe363bd88"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.7.1/dfinstall_2.7.1_linux_arm64.tar.gz"
      sha256 "6afda7f541ad70b509202732b2830c94376878391b1f643646c0c284177d1bec"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.7.1/dfinstall_2.7.1_linux_amd64.tar.gz"
      sha256 "bc91239b94f85ffe2bc059750f7679497a021bcf7ec6acc0fec8bb945dca6bf7"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.7.1/dfinstall-content_2.7.1.tar.gz"
    sha256 "ab61b76f43ca4b75465e795f28742d1fe3f26d3433f522db33ac73cf01fc524f"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
