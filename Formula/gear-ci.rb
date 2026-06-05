class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.05.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.2/gear-ci-darwin-arm64"
      sha256 "5f9f09c9d7cf2ab9dda11fba26e259975fac954fdc0ed52168cfc90edef21416"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.2/gear-ci-darwin-amd64"
      sha256 "6f61d6734c0e57c57683ff9379ccaae54023f605f5eb586d1577934f6bc94da9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.2/gear-ci-linux-amd64"
      sha256 "bb74f0dbbe34e1dbd24791e5e92c01d8d8feeb77781a6c8680617ae2cce414f6"
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
