class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.04.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.1/gear-ci-darwin-arm64"
      sha256 "f44ece0dc5f129a8cfe24af9d694b783cc8696e6db45364ca214014c836005ad"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.1/gear-ci-darwin-amd64"
      sha256 "50d0d39d1afb8bae9cc05a8637cfc959100d35bc24243eca9e3f9f1f3c818c85"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.1/gear-ci-linux-amd64"
      sha256 "1d3007e5ce13b539496b89883a5662644ee7700386dbc6aac26b6aa78fd456dc"
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
