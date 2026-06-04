class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.04.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.3/gear-ci-darwin-arm64"
      sha256 "6cae7670e8ee5808ff5ff7101615b804586ad20065311c836cd6b2a2264dba76"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.3/gear-ci-darwin-amd64"
      sha256 "11eea8c9e5934ef9b7bc67e7e6227580b2ef12188e13e110b544891aefbf788b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.3/gear-ci-linux-amd64"
      sha256 "8a1ff068b31adbf13b8201421bbabacf59bde2a7b091230c3fbe167b0e91c6bb"
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
