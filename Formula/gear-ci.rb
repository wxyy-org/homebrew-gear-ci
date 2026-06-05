class GearCi < Formula
  desc "Local CI/CD tool, compatible with GitHub Actions YAML format"
  homepage "https://github.com/wxyy-org/gear-ci"
  version "2026.06.05.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.3/gear-ci-darwin-arm64"
      sha256 "fa0061de67d6d04d758292acf88b455633bf73ada64e9cee888292a8eeabf519"
    end
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.3/gear-ci-darwin-amd64"
      sha256 "44aa849833bda5d92d7794d447d9aee8b1d18ab61678749b8c5763c959708955"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wxyy-org/gear-ci-release/releases/download/2026.06.05.3/gear-ci-linux-amd64"
      sha256 "257dc654fe176710efbcde085b6365c34d7c032cca7f825d6cfd4a9dd90a330e"
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
