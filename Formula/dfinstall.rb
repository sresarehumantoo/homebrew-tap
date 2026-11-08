class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.2/dfinstall_2.4.2_darwin_arm64.tar.gz"
      sha256 "cd1537a81013121d083bb3971550b4ade88733362fa70cb22b84562b02e6ac33"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.2/dfinstall_2.4.2_darwin_amd64.tar.gz"
      sha256 "6b3bd21af08fe8ed253a4367148af1ff5c2fdf8a62040e86fabd02984de36ac2"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.2/dfinstall_2.4.2_linux_arm64.tar.gz"
      sha256 "193f8d575616763cd140aac31c1f9f88d7f4579cc97e9452ab27eb02450ff082"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.2/dfinstall_2.4.2_linux_amd64.tar.gz"
      sha256 "de663212d7d7e420c37baaa4d676413e8cf0cbdd55d1eb462595745c09f52b59"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.2/dfinstall-content_2.4.2.tar.gz"
    sha256 "e36db8bc9093f15bfcfb7dac3079f3bc3ea78d208a18ac66c95f03cc0510c4fe"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
