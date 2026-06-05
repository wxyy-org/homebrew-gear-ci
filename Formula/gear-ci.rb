class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.05.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.4/gear-ci-darwin-arm64"
      sha256 "6c788334bd456a58fc0bcc75df1ab8b62a9e36967260b80962d7c1d1f8378e5a"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.4/gear-ci-darwin-amd64"
      sha256 "c78d8bc61237de9cf93e16b58b51128f0bdded4d290bdfa6e8eb959ad5e4d5e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.4/gear-ci-linux-amd64"
      sha256 "7fa43790a4683bf2c67f4f3839c27c76fca8c23f0d8c9e8ef8619a0bb558473d"
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
