# Homebrew formula for the PromptPager bridge.
#
# Ship this from a tap repo (e.g. RujitRaval/homebrew-tap) so users can:
#   brew install rujitraval/tap/promptpager
#
# `url`/`sha256` track the published npm tarball for each release.
class Promptpager < Formula
  desc "Agent & terminal remote bridge for iPhone + Apple Watch"
  homepage "https://github.com/RujitRaval/promptpager"
  url "https://registry.npmjs.org/@rujitraval/promptpager/-/promptpager-0.2.0.tgz"
  sha256 "9f718b8c555ec74cf6fbfdf2f624bc2d6b414afb3fe03fc7c9189e9e1380703e"
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
