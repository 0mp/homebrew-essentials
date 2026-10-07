# SPDX-FileCopyrightText: 2024-2026 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause
class GitArc < Formula
  rev = "4aeab132f6d8f38f5434315db22dbeb3072e5d2c"
  url_prefix = "https://raw.githubusercontent.com/freebsd/freebsd-src/" + rev + "/tools/tools/git/"

  desc "Wrapper to improve integration between git and arcanist"
  homepage "https://cgit.freebsd.org/src/plain/tools/tools/git/"
  url url_prefix + "git-arc.sh"
  version "20260901" # Follows FreeBSD's devel/freebsd-git-devtools.
  sha256 "8e96b29a2387046063c81eeeda63300e921ef1bc0f2b487855ad8a080d4bb267"
  license "BSD-2-Clause"

  depends_on "arcanist"
  depends_on "git"
  depends_on "jq"

  resource "manpage" do
    url url_prefix + "git-arc.1"
    sha256 "94e936ea672f36fe6b09ea999e4e9801e6fb4632984dbda53b12c77bbcf9da5c"
  end

  def install
    libexec.install "git-arc.sh"
    chmod 0755, libexec/"git-arc.sh"
    (bin/"git-arc").write_env_script libexec/"git-arc.sh",
      ARC_CMD: HOMEBREW_PREFIX/"bin/arc",
      LOCALBASE: HOMEBREW_PREFIX
    resource("manpage").stage do
      man1.install "git-arc.1"
    end
  end

  test do
    system "#{bin}/git-arc", "--help"
  end
end
