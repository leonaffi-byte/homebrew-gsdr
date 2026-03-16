class Gsdr < Formula
  desc "GSD Reloaded - Autonomous spec-driven development for Claude Code"
  homepage "https://github.com/leonaffi-byte/gsdr"
  url "https://registry.npmjs.org/gsdr/-/gsdr-1.0.0.tgz"
  license "MIT"

  depends_on "node@18"

  def install
    system "npm", "install", "--global", "--prefix", prefix, "gsdr@#{version}"
  end

  def post_install
    system bin/"gsdr"
  end

  def caveats
    <<~EOS
      GSDR has been installed as a Claude Code plugin.

      To use it, start Claude Code with:
        claude --plugin-dir ~/.claude/plugins/local/gsdr

      Or add to your Claude Code settings, then run:
        /gsdr:new-project
    EOS
  end

  test do
    assert_match "GSDR", shell_output("#{bin}/gsdr --help")
  end
end
