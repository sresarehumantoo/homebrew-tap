class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.1/dfinstall_2.0.1_darwin_arm64.tar.gz"
      sha256 "543f606abba648c87803fa66d28590e799326d327cdf42ba8c54e74c267a29bb"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.1/dfinstall_2.0.1_darwin_amd64.tar.gz"
      sha256 "e566d1d7763d4531e658fd68ffb0854abe96c6afc036b1d9e38c1145201e1626"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.1/dfinstall_2.0.1_linux_arm64.tar.gz"
      sha256 "d45cea73eb5c8e21a1bbef9c0e997b646493cc66d1162875b2f5bbc188a10ae0"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.0.1/dfinstall_2.0.1_linux_amd64.tar.gz"
      sha256 "6f6060bd88c8564b147778d83fa1bf5343322c7c6b369b611aab3d4dcfb40b61"
    end
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
