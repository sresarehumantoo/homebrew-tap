class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.5.0/dfinstall_2.5.0_darwin_arm64.tar.gz"
      sha256 "17c1df959f73f6899eb63751574e85ad8779918f1818f2059fafe6cbec89bde0"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.5.0/dfinstall_2.5.0_darwin_amd64.tar.gz"
      sha256 "9bdfd3f5c6a006637853f3a90c9deedae8dea072748a1fc1e14cb24edfcfa23c"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.5.0/dfinstall_2.5.0_linux_arm64.tar.gz"
      sha256 "86106328a773daf32eaea94a47e478ee1fd1204e8877508f24b9d7bdf207a952"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.5.0/dfinstall_2.5.0_linux_amd64.tar.gz"
      sha256 "217864aee933be994db54a267932e2a393ff49414775e9d14e83206df2d96037"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.5.0/dfinstall-content_2.5.0.tar.gz"
    sha256 "d3d080b2840d173ef07c6c3048ee3a0b041d5e84e34be456f94d5835f8670636"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
