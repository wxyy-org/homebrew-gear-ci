class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.04.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.2/gear-ci-darwin-arm64"
      sha256 "d1c8a3a7e05ccea7af7e465d0bb2db361028f2f4aa35c240341d6e310eb89c49"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.2/gear-ci-darwin-amd64"
      sha256 "b67aaafcbdb5fc4ebe3534ba452fa846fb8b2d6aab092542756d0cad37cfe005"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.04.2/gear-ci-linux-amd64"
      sha256 "0e37f257767e607d0e03d13e4c9ae4405489695e4b8150d20dcd2a80fa17676b"
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
