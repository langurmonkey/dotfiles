# Background story

This is the abridged story of how I finally settled with the current configuration represented by my [dotfiles](https://gitlab.com/langurmonkey/dotfiles) repository.

TLDR; I like elegant and streamlined solutions. Traditional floating window managers and desktop environments are neither elegant nor streamlined at core. Tiled window managers are. Pull the thread.

I have been using Linux for a long time. During that time, I distro-hopped several times. I started with Red Hat, then jumped to Mandrake (before the fusion that produced Mandriva, which I never used), then to Ubuntu and back to Mandrake. Then Fedora. I also tried Mint and Manjaro and finally settled with Antergos.

Right now I use Antergos in all my personal machines, and Ubuntu at work (due to reasons that are out of my hands). 

I also tried a bunch of desktop environments. Gnome 2, Gnome Shell, KDE and KDE Plasma, Cinnamon, Mate, Budgie, Xfce (which I used for a long time), you name it. I never felt at home in any of these. All of them feel bloated and not very elegant and installed far too many packages by default which I never used. This changed when I discovered that I could just do away with desktop environments altogether and just use a window manager. A window manager just does this... manages windows. It positions windows on screens and paints the window borders (if any).

I had also been using tmux as a terminal multiplexer for a long time (actually, I still have some tmux config files in my dotfiles repo even though I hardly use it anymore these days), so the concept of a tiling window manager to make the most of the available space felt natural. That is how I ended up with ``i3wm`` and when this repository started really growing, as previously I only used it for my vim and tmux dotfiles. Right now, I can basically check out the repository to a new machine, deploy it and the environment should for the most part work out of the box (minus some programs that I still need to add to the deploy script).
