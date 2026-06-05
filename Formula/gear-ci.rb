class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.05.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.0/gear-ci-darwin-arm64"
      sha256 "25f4f765da750b6b14cdb99a16f097e56376df000185e3a47df3d4a8180d7bf8"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.0/gear-ci-darwin-amd64"
      sha256 "86f3061024ea8d77e365ebf8bc80cbc439af1e2d548e7b8cf0d6c08667fd636d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.0/gear-ci-linux-amd64"
      sha256 "33a2ffac8344778aa6c68d73369fffda708df18f301660993cf38e3569a64b70"
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
