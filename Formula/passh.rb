# Copyright (c) 2023 Mateusz Piotrowski <0mp@FreeBSD.org>
# SPDX-License-Identifier: BSD-2-Clause

class Passh < Formula
  desc "Non-interactive password inputting CLI"
  homepage "https://github.com/clarkwang/passh"
  url "https://github.com/clarkwang/passh/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "40ea6f141cd52fcf354f9b78a553010d9f94704b1a3b3c25842f017c4fe21e10"
  license "GPL-3.0-or-later"

  def install
    system "make"
    bin.install "passh"
  end

  test do
    system "#{bin}/passh", "-h"
  end
end
