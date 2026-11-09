class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.4.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.4/dfinstall_2.4.4_darwin_arm64.tar.gz"
      sha256 "d65681c1070bad1a464604fca83d0bad1c2806d7155272fa5ea4209ac8e95c8e"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.4/dfinstall_2.4.4_darwin_amd64.tar.gz"
      sha256 "024b26b7a005dbd94bb386472a1404bbd65e0cf2f157e3d9558be74521dbe828"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.4/dfinstall_2.4.4_linux_arm64.tar.gz"
      sha256 "1af22da9cfbb964e211efec835ade8f4798e986283aa003d1a84770e1d421ecc"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.4/dfinstall_2.4.4_linux_amd64.tar.gz"
      sha256 "3e914765f35229377c4e2bd828aebbc8af3a078de0cba932acc76bbd34e1e305"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.4/dfinstall-content_2.4.4.tar.gz"
    sha256 "4e33fd1d3b631c6e5fa4b59b791e2aa22a7df7b9ec4e96385ce5dfe0edb3ac33"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
