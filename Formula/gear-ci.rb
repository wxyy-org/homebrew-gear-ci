class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.04.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.0/gear-ci-darwin-arm64"
      sha256 "2c841be23073c190aad0b87bcdf75e5654dd9cf6d8ca0a130440550cddc74dc3"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.0/gear-ci-darwin-amd64"
      sha256 "d0fc6a0d39d42c20dd7797299e325110136bbac415203b530d52e99083112cd3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.0/gear-ci-linux-amd64"
      sha256 "514fde5fbd839064846d0ea584c3918bf2008935440d38f79b97653713a77638"
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
