class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.2/dfinstall_2.0.2_darwin_arm64.tar.gz"
      sha256 "6814374b38e38ac894fcef0ad035fdea2d8c26e05dd790d80756ce836d8ff63d"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.2/dfinstall_2.0.2_darwin_amd64.tar.gz"
      sha256 "a5210c88b51b721f8404d9bbfb8fed9e42f8fa68c5bb591427e52e82caf36505"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.2/dfinstall_2.0.2_linux_arm64.tar.gz"
      sha256 "07b93c143d7fe8e66c43b33008bb168b924835ca50ce7cc71545fbb71d2a7bf7"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.2/dfinstall_2.0.2_linux_amd64.tar.gz"
      sha256 "b506a155fd21f06edd316149eb9ebfb37b87c4981aa1519dcc54606b4f1c6f49"
    end
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
