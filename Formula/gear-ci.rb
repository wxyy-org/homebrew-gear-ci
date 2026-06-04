class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.04.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.4/gear-ci-darwin-arm64"
      sha256 "d009770e77667abab12a5fdfcf59422baee405660c27f209fb1589817c14d2d5"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.4/gear-ci-darwin-amd64"
      sha256 "4ffcdbd73e2f8a7f47be5b6fb43e66a50b5ffee632d41db14b376477ceca40fe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.4/gear-ci-linux-amd64"
      sha256 "c7e65989ad6dea9fa087d96b8453540b972db0710b74eaa707b5a4dfd4f409c4"
    end
  end

  def install
    bin.install Dir["gear-ci-*"].first => "gear-ci"
  end

  service do
    run [bin/"gear-ci", "start"]
    environment_variables GEAR_CI_SERVICE: "1"
    log_path var/"log/gear-ci.log"
    error_log_path var/"log/gear-ci.err"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gear-ci --version")
  end
end
