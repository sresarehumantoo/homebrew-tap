class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.4.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.6/dfinstall_2.4.6_darwin_arm64.tar.gz"
      sha256 "da6c3373c0a964985b1f8005be03cb157ca2d724d824b88cd81f5625be30278a"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.6/dfinstall_2.4.6_darwin_amd64.tar.gz"
      sha256 "81f05ba6916be00d1e800af2af0fbacfbe5d9608a060007523ca2f70726d7568"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.6/dfinstall_2.4.6_linux_arm64.tar.gz"
      sha256 "72441be1615330e7ffa0025b21a83daed4982aa3eb3791233b145cb0cd6e201a"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.6/dfinstall_2.4.6_linux_amd64.tar.gz"
      sha256 "6e33b2c01c4144b6591fab32fed79427a0114b17b9736b1a2877e685b09c19ad"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.6/dfinstall-content_2.4.6.tar.gz"
    sha256 "7733f29b6dfda6ea5f338bb9d9f0b1ce230c54e26b6544b3d19efe4d3ca38a9f"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
