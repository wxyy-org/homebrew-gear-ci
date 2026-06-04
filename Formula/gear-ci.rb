class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/v0.1.5/gear-ci-darwin-arm64"
      sha256 "ffd02f1915c6cc3640e9e24a4eb711047d2d661801dfe544d3d59aa8cf8447d7"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/v0.1.5/gear-ci-darwin-amd64"
      sha256 "1992360982800e305acd730ca24ff865e27ce2561512a0bf185d071c08d044b3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/v0.1.5/gear-ci-linux-amd64"
      sha256 "66d77828cd5ceae28b7dd42f8d1228a945108b8d4a7ad11c722690997476abdf"
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
