class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "3.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v3.0.1/dfinstall_3.0.1_darwin_arm64.tar.gz"
      sha256 "f6401208278a420a908704f3cfa876ffbd78b0d8d4a97400b4d3ed6954e722cc"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v3.0.1/dfinstall_3.0.1_darwin_amd64.tar.gz"
      sha256 "03d424f3a1f45f70351d2eece5e480368a30a50741a22c9699139b3396ec8fc8"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v3.0.1/dfinstall_3.0.1_linux_arm64.tar.gz"
      sha256 "77d678bee3c5ab6e354fffd8c098187dfa15ffd33629a4fbeffc54c7fea50916"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v3.0.1/dfinstall_3.0.1_linux_amd64.tar.gz"
      sha256 "a841e90c58080a4d554f436237389abed145106b1dcbcce683489c7a7d32aea8"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v3.0.1/dfinstall-content_3.0.1.tar.gz"
    sha256 "905ad3ab02a7c1dfb74e5e1bf0b9131091547970813e6712e1dc63388a23f3f7"
  end

  def install
    bin.install "dfinstall"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
