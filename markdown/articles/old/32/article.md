# Mathematics

\\[
x = \\frac{-b \\pm \\sqrt{b^2 -4ac}}{2a}
\\]

The above equation is the quadratic formula which allows you to solve polynomials of the following form \\( ax^2 + bx + c = 0 \\). The following is a derivation of the
above result:

\\[
ax^2 + bx + c = 0
\\]

\\[
x^2 + \\frac{b}{a}x + \\frac{c}{a} = 0
\\]

\\[
x^2 + \\frac{b}{a}x = -\\frac{c}{a}
\\]

\\[
x\^2 + \\frac{b}{a}x + (\\frac{b}{2a})\^2 = \\frac{b\^2}{4a\^2} - \\frac{c}{a}
\\]

\\[
(x + \\frac{b}{2a})^2 = \\frac{b^2 - 4ac}{4a^2}
\\]

\\[
x + \\frac{b}{2a} = \\pm \\frac{\\sqrt{b^2 - 4ac}}{2a}
\\]

\\[
x = \\frac{-b \\pm \\sqrt{b^2 -4ac}}{2a}
\\]

This is a test for converting from Markdown (incl. MathJax) to HTML. Hopefully, I can find a stable way to do this conversion by making used of a Makefile which allows me to create this when there are multiple .md files present in directory.

What we have found is that the application "markdown" provided by the package "discount" (on Archlinux) is not a good conversion tool.
