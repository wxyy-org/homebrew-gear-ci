class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.04.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.5/gear-ci-darwin-arm64"
      sha256 "7e494cf1a8da9d2cd0420f662b39c7d0822262e06eefc768ae286526d54cb614"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.5/gear-ci-darwin-amd64"
      sha256 "77a2a659d46f52ef94f3a9873287807d7e1aa1dcefa16e81e51b0ef9bc165de7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.5/gear-ci-linux-amd64"
      sha256 "2a099dfdfdbaaadf6116adb713f9c5f6db604efe686e6b6cf31e66d75aeeb827"
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
