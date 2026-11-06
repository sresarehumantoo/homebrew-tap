class Dfinstall < Formula
  desc "Dotfiles installer and manager"
  homepage "https://github.com/sresarehumantoo/dotfiles"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.0/dfinstall_2.4.0_darwin_arm64.tar.gz"
      sha256 "ac2c60268f4a1798bcad3afe86eb70a3ac832145ed9caa6dfd4ef6653dfd7e96"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.0/dfinstall_2.4.0_darwin_amd64.tar.gz"
      sha256 "c10ba9b2c95a649bb4eaf0ce1579494c0f2f81b29ac543abb80eb7f94ec0ecd5"
    end
  end

  on_linux do
    depends_on "git"

    on_arm do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.0/dfinstall_2.4.0_linux_arm64.tar.gz"
      sha256 "31afc338f8b4b15afeabef9aec5545f542a919bcb3edd13588d32694b5c7f69e"
    end
    on_intel do
      url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.0/dfinstall_2.4.0_linux_amd64.tar.gz"
      sha256 "85c3f6fcdef8b0bfcc1ad66bfd5bfb36411ce26ac4e82b3f486c82a10d464bb0"
    end
  end

  resource "content" do
    url "https://github.com/sresarehumantoo/dotfiles/releases/download/v2.4.0/dfinstall-content_2.4.0.tar.gz"
    sha256 "592876749eaf4b5e8a3ff779fcfa3e46ecc86daca5401099bb399d8cbe15ec8c"
  end

  def install
    bin.install "dfinstall", "dfinstall-mcp"
    resource("content").stage { pkgshare.install "config", ".dfinstall-content.json" }
  end

  test do
    assert_match "(brew)", shell_output("#{bin}/dfinstall --version")
  end
end
