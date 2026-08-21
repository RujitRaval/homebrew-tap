# Homebrew formula for the PromptPager bridge.
#
# Ship this from a tap repo (e.g. RujitRaval/homebrew-tap) so users can:
#   brew install rujitraval/tap/promptpager
#
# `url`/`sha256` track the published npm tarball for each release.
class Promptpager < Formula
  desc "Agent & terminal remote bridge for iPhone + Apple Watch"
  homepage "https://github.com/RujitRaval/promptpager"
  url "https://registry.npmjs.org/@rujitraval/promptpager/-/promptpager-0.2.1.tgz"
  sha256 "5c80298be4df6070ab0025f61fb4ac140979690fb4e515670cd8f8fee1ff0dd5"
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
