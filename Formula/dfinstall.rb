class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.4.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.5/dfinstall_2.4.5_darwin_arm64.tar.gz"
      sha256 "72d17b6fc30d4be2a59668105125cff9418fc8e961449efb3998c1040865657e"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.5/dfinstall_2.4.5_darwin_amd64.tar.gz"
      sha256 "31e72b45c83d7d6d34fcfd6300f30b68a0f6f3209ae0e8b98769983a549b96c2"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.5/dfinstall_2.4.5_linux_arm64.tar.gz"
      sha256 "7a950acda521a986f9320148da51cc5d6a82a0d1d97321bb0c9a95eb57dc64c3"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.5/dfinstall_2.4.5_linux_amd64.tar.gz"
      sha256 "3b7cde3f3e8cca529058b9779ffa98d12c2c77044921fc0ea8dd5e91770f0c82"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.5/dfinstall-content_2.4.5.tar.gz"
    sha256 "5da73ab3ac4a8a5d632a3c6181700d7166015cda63de298dbb7c84d429ee2f83"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
