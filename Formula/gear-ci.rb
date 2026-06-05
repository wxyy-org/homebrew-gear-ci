class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.05.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.5/gear-ci-darwin-arm64"
      sha256 "6ae64567f5245eef0d96d247d98adab0647dcac6c8c7c358547c47d4607baaff"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.5/gear-ci-darwin-amd64"
      sha256 "89cc1cce4c3ea224a8ad9e1d1612ab294de990e9032ec62c26dbb101232b0ec3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.5/gear-ci-linux-amd64"
      sha256 "c5b0db9845b5637103f0891b590b656055e8952ef5a686ed8a4ed2031c9b3a20"
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
