# Homebrew formula for the PromptPager bridge.
#
# Ship this from a tap repo (e.g. RujitRaval/homebrew-tap) so users can:
#   brew install rujitraval/tap/promptpager
#
# `url`/`sha256` track the published npm tarball for each release.
class Promptpager < Formula
  desc "Agent & terminal remote bridge for iPhone + Apple Watch"
  homepage "https://github.com/RujitRaval/promptpager"
  url "https://registry.npmjs.org/@rujitraval/promptpager/-/promptpager-0.3.1.tgz"
  sha256 "d1bc4c24d62bec17f80a4aeddaa62e3bda29c522d9180b1d1cc73eb16ef69c14"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "PromptPager bridge", shell_output("#{bin}/promptpager --help")
  end
end
