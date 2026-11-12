class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.8.0/dfinstall_2.8.0_darwin_arm64.tar.gz"
      sha256 "04c0536e3dc114c3bd4660888f4a4ab8d25c5b6ec23e5addafe57323b3b7c811"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.8.0/dfinstall_2.8.0_darwin_amd64.tar.gz"
      sha256 "0d6c54f553453872e5c3313238510394d45a35e24c0a7a62ce41a1daa6945d4d"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.8.0/dfinstall_2.8.0_linux_arm64.tar.gz"
      sha256 "e87f9920dc9b8e5a387c7ba97911ee37c134ab659ce029bb781c6ac9c52ca8e1"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.8.0/dfinstall_2.8.0_linux_amd64.tar.gz"
      sha256 "58c7e8d8193dfa4cd0d2ed2e5329ee04d067e584f9b98792bdd520a7745fb0bf"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.8.0/dfinstall-content_2.8.0.tar.gz"
    sha256 "31fc0ef8643659bf6a4f9f6f755a5816755de400b90762cd8e70df0ce23922dd"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
