# Homebrew formula for the PromptPager bridge.
#
# Ship this from a tap repo (e.g. RujitRaval/homebrew-tap) so users can:
#   brew install rujitraval/tap/promptpager
#
# `url`/`sha256` track the published npm tarball for each release.
class Promptpager < Formula
  desc "Agent & terminal remote bridge for iPhone + Apple Watch"
  homepage "https://github.com/RujitRaval/promptpager"
  url "https://registry.npmjs.org/@rujitraval/promptpager/-/promptpager-0.2.2.tgz"
  sha256 "ff2d20c8ef5bc49cd7380db54a125c7edee0f6d6fbba267249dfcf69486b360b"
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
