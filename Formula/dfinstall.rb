class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.6.0/dfinstall_2.6.0_darwin_arm64.tar.gz"
      sha256 "da148079cf3fa529d5d1cb7bcab39e63e460213429d115ad1043b4c3fba64d33"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.6.0/dfinstall_2.6.0_darwin_amd64.tar.gz"
      sha256 "9c660f066afbc99c1649462992ac463993fbd0bb889facbaa0ba6d1e371d98d2"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.6.0/dfinstall_2.6.0_linux_arm64.tar.gz"
      sha256 "af98c993c73647ce652dc98bdb7a533c0982a4010302febd73b5d41e2c784fa2"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.6.0/dfinstall_2.6.0_linux_amd64.tar.gz"
      sha256 "7dd9d0ddcb93b37091cd3273ff66d667d15806063a78a449796dd4d54a9e2961"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.6.0/dfinstall-content_2.6.0.tar.gz"
    sha256 "385f8b1dea6dcddc9508da1b8a3ad47ab5e2e51fa8551b068b6662a90deddb8d"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
