class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v3.0.0/dfinstall_3.0.0_darwin_arm64.tar.gz"
      sha256 "0d3f5ec965e96d72781bddd5c096c842705989043379d633b4e7c0875a9b26f6"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v3.0.0/dfinstall_3.0.0_darwin_amd64.tar.gz"
      sha256 "6a71d3edb5675a485601acab4195b743d84374fd9ae9c2e1322105ef769cdb96"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v3.0.0/dfinstall_3.0.0_linux_arm64.tar.gz"
      sha256 "a137bec1e852f4de4cd0989749be2a1d71fa48cb6773280fd78a98c3f5637764"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v3.0.0/dfinstall_3.0.0_linux_amd64.tar.gz"
      sha256 "62e678aa514c16382fe805392deb19f83ee96bf4a71c3301d67241d69a47423e"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v3.0.0/dfinstall-content_3.0.0.tar.gz"
    sha256 "b766f20bac27b867100f334739d3f91acc6e73d6381994c69a86e6e7146123c0"
  end

  def install
    bin.install "dfinstall"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
