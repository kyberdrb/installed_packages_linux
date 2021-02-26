# TODO link configuration files from `configs` into this package list

* linux-firmware-iwlwifi-git - linux firmware with the support of Intel wireless devices, such as bluetooth and Wi-Fi. Replaces the default `linux-firmware` package.
    - In my case it provided newer firmware for my 
        - Intel bluetooth device
    
                Intel Wireless 8260 Bluetooth
                [journalctl] Bluetooth: hci0: Found device firmware: intel/ibt-11-5.sfi)
            
        - and Wi-Fi device
        
                Intel Corporation Wireless 8260 (rev 3a)
                
                [journalctl]
                Intel(R) Dual Band Wireless AC 8260, REV=0x208
                ...
                kernel: iwlwifi 0000:01:00.0: loaded firmware version 36.ad812ee0.0 8000C-36.ucode op_mode iwlmvm

* shellcheck - shell script analysis tool and syntax checker

* git - version control system
    - `~/.gitconfig` [[1]](https://stackoverflow.com/questions/5519007/how-do-i-make-git-merges-default-be-no-ff-no-commit/9252042#9252042)
    
        Commands:
    
            git config --global merge.commit no
            git config --global merge.ff no
            git config --global pull.ff yes
    
        ...produce this output with `cat ~/.gitconfig`
    
            [user]
                email = your@email.address
                name = your_name
            [merge]
                commit = no
                ff = no
            [pull]
                ff = yes
        
* linux-lqx linux-lqx-headers linux-ck-skylake linux-ck-skylake-headers linux-tkg-muqss-skylake linux-tkg-muqss-skylake-headers linux-pf-skylake linux-pf-headers-skylake linux-clear-bin linux-clear-headers-bin
    - Building a kernel from source, e.g. linux-ck on my laptop with i5-6300U, took approximately 3 hours.
    - BEFORE BUILDING A KERNEL, REMOUNT THE `BOOT` PARTITION AS WRITABLE (if it's not already)
    - https://wiki.archlinux.org/index.php/Kernel
    - To switch kernels, you need to change the configuration of the bootloader. I use `bootctl` - the systemd bootloader. For available kernel names and presets see the directory `/etc/mkinitcpio.d/`
        - https://dev.to/sakshatshinde/a-simple-guide-to-install-linux-zen-the-zen-kernel-on-arch-linux-for-systemd-boot-1b0e
        - Sources
            - [How to add repo to pacman](https://lonewolf.pedrohlc.com/chaotic-aur/)
            - [How to add repo to pacman - with key signing](https://wiki.archlinux.org/index.php/Unofficial_user_repositories/Repo-ck#Add_Repo)
            - [chaotic - repo package list](http://chaotic.bangl.de/chaotic-aur/x86_64/)
            - https://wiki.archlinux.org/index.php/Linux-ck
            - https://wiki.archlinux.org/index.php/Unofficial_user_repositories#post-factum_kernels
            - https://wiki.archlinux.org/index.php/Pacman/Package_signing#Adding_unofficial_keys
            - https://jlk.fjfi.cvut.cz/arch/manpages/man/pacman.conf.5#PACKAGE_AND_DATABASE_SIGNATURE_CHECKING
            - [gpg --recv-keys](https://bbs.archlinux.org/viewtopic.php?pid=1495376#p1495376)
            - https://stackoverflow.com/questions/35251359/cannot-upgrade-archlinux-pacman-syu-not-working/35256655#35256655
            - https://liquorix.net/
            - https://github.com/Frogging-Family/linux-tkg
            - [MuQSS CPU Scheduler Explained](https://lkml.org/lkml/2016/10/29/4)
            
    - Benchmark the performance of different kernels to quantify the performance differences
    - `virtualbox-host-dkms` broken in 5.10.17 for kernel `lqx` which renders the VirtualBox virtual machines unable to run. 
        - Solution: https://forum.endeavouros.com/t/anyone-else-getting-errors-with-virtualbox-host-dkms-and-linux-lqx/11835/9
        - Solution - origin: https://bbs.archlinux.org/viewtopic.php?id=263393
        - Ticket: https://www.virtualbox.org/ticket/20178
        - watch for errors during kernel upgrades when compiling dkms modules - maybe in the next updates they will fix this. For now I'll stick with the `pf` kernel.
    
* unixbench interbench - benchmarking kernel and system performance

    See documentation in https://github.com/kyberdrb/benchmarking-linux-kernels
    
    - https://wiki.archlinux.org/index.php/Benchmarking
    - https://github.com/kdlucas/byte-unixbench
    - https://github.com/ckolivas/interbench
    - https://linux.die.net/man/8/interbench

* eidklient disig-web-signer - aplikacie pre pripojenie k portalu www.slovensko.sk
    - Start SmardCard service: `systemctl start pcscd.service`
    - pripravit si hesla k elektronickemu OP
    - spustit aplikaciu eID [XFCE: Applications - Other - Aplikacia pre eID]
    - vlozit elekronicky obciansky preukaz (OP) cipom nahor do lubovolnej SmartCard citacky: bud integrovanej v notoebooku/PC alebo externej citacky [napriklad do tej, ktora bola dodana spolu s OP]
    - nasledovat instrukcie v aplikacii eID
    - pripojit sa k portalu slovensko.sk
    - Sources:
        - https://wiki.archlinux.org/index.php/Smartcards#Installation
        - https://aur.archlinux.org/packages/eidklient/
        - https://aur.archlinux.org/packages/disig-web-signer/

* aic94xx-firmware wd719x-firmware linux
    - missing firmwares for my laptop
    - install also the `linux` package to load these modules into kernel
* vim, gvim - vim text editor with its graphical extension
    - Plugins
        - nerdtree
            - starting nerdtree: in address bar enter `NERDTree`
            - switch between windows with `Ctrl-W + h/j/k/l OR arrow keys`
        - clang_complete
            - complete statements with `Ctrl-N` or `Ctrl-P`
    - `~/.vimrc` - configuration file with preferred settings

            set tabstop=2
            set shiftwidth=2
            set expandtab
            set display+=lastline
            set ignorecase
            set number
            let g:NERDTreeNodeDelimiter = "\u00a0"
    
    - Running gvim with NERDtree with all tabs from previous session
        Run this command from **Application Finder** `Alt + F2` or from terminal
    
            gvim -S ~/git/freiwillige_aufgaben/vim_Sitzungen/Sitzung.vim -c "tabdo NERDTree" -c "tabdo wincmd l" -c "tabnext"
            
        Description: Open a session in vim, for each tab add NERD Tree, for each tab move the focus from NERD Tree to editing area, and move the focus to the next (first) tab.
            
    - Closing the session
        Copy the below line, press `:` [colon] to get in to command line and paste it there with keyboard shortcut `Ctrl + R` and then `*`
    
            tabdo NERDTreeClose | tabnext | mks! ~/git/freiwillige_aufgaben/vim_Sitzungen/Sitzung.vim
            
        Description: For each tab close NERD Tree, move the focus to the next (first) tab, and save current session to a file overriding the previous one.

        - Sources
            - https://vi.stackexchange.com/questions/4141/how-to-indent-as-spaces-instead-of-tab/4175#4175
            - https://vim.fandom.com/wiki/Working_with_long_lines
            - https://vimawesome.com/plugin/nerdtree-red
            - (https://github.com/preservim/nerdtree/issues/928#issuecomment-445755327)[fix for `^G` in the nerdtree]
            - https://github.com/tpope/vim-surround
            - https://vi.stackexchange.com/questions/82/how-to-get-intelligent-c-auto-completion/389#389
            - https://vimawesome.com/plugin/clang-complete-please-everybody
            - https://superuser.com/questions/280500/how-does-one-switch-between-windows-on-vim/280501#280501
    
* atom - text editor
    - Installed packages - Edit → Preferences → Install:
        - asciidoc-preview
            - AsciiDoc support
        - highlight-selected
            - Highlights the current word selected when double clicking
        
    - Configuration:
        - Disable welcome screen: uncheck the “Show Welcome Guide when opening Atom” box.
        
            Source: https://discuss.atom.io/t/how-to-get-rid-of-welcome-md/12838/10
        - Edit -- Preferences -- Core -- disable _Allow Pending Pane Items_ - temporary preview of files - fixes the bug with opening a file permanently from the tree view
        
            Source: https://discuss.atom.io/t/atom-doesnt-open-file-on-single-click-in-tree-view/27902/9
        - Edit -- Preferences -- Themes -- UI Theme: Atom Light; Syntax Theme: Atom Light
        - Edit -- Preferences -- Editor -- disable _Atomic Soft Tabs_
            - Font Family: `Source Code Pro, Menlo, Consolas, DejaVu Sans Mono, monospace`
                - because these monospace fonts have clearly distinguishable among the characters 'iI1l' 'oO0 - especially the zero :)' 'sS5' 'A4' 'g9' 'B8' ''Z2
            - Tab Length: 4  
            - Tab Type: soft
        
            For the list of all avaliable fonts, execue this command in terminal
                
                fc-list | cut -d ':' -f2 | cut -d' ' -f1 --complement | less
        
            Source: https://discuss.atom.io/t/how-do-you-use-spaces-instead-of-tabs/64730/2
        - Disable spell-cheking (it disturbs me when almost everything is red-squiggly-underlined)
            - Edit → Preferences → Packages → search for `spell` → disable package `spell-check`
            
            Source: https://superuser.com/questions/999695/how-to-disable-spell-checking-in-atom/1022779#1022779
        - Keybindings -- click on _your keymap file_. Copy this to it:
         
                'atom-workspace atom-text-editor':
                    'ctrl-left': 'editor:move-to-previous-word-boundary'
                    'ctrl-right': 'editor:move-to-next-word-boundary'
                    'ctrl-shift-left': 'editor:select-to-previous-word-boundary'
                    'ctrl-shift-right': 'editor:select-to-next-word-boundary'
                    'ctrl-backspace': 'editor:delete-to-previous-word-boundary'
                    'ctrl-delete': 'editor:delete-to-next-word-boundary'
                    'ctrl-shift-S': 'window:save-all'
                    'ctrl-alt-S': 'core:save-as'
                    'alt-z':'editor:toggle-soft-wrap'
                     
             Sources:
             - https://www.reddit.com/r/Atom/comments/534mno/how_to_configure_atom_to_properly_delete_words/
             - https://discuss.atom.io/t/ctrl-backspace-deletes-last-character-from-line-above/56256/3
             - https://discuss.atom.io/t/toggle-soft-wrap-key-binding/2643

    - Keyboard shortcuts:
        - Command Pallete: Ctrl-Shift-P
        - Markdown Preview: Ctrl-Shift-M
        - AsciiDoc Preview: Ctrl-Shift-A
        - Duplicate Line: Ctrl + Shift + D
        
* vscodium-bin-marketplace - debranded Visual Studio Code with Visual Studio Code's marketplace feature
    - Extensions:
        - AsciiDoc - `.adoc` files preview
    - Preferences
        - Text Editor -- Font -- Font Family: `'Source Code Pro', 'Menlo', 'Consolas', 'DejaVu Sans Mono', 'monospace', monospace, 'Droid Sans Fallback'`
            - because these monospace fonts have clearly distinguishable among the characters 'iI1l' 'oO0 - especially the zero :)' 'sS5' 'A4' 'g9' 'B8' ''Z2
        
* obs - Open Broadcast Software - a tool to streaming and recording audio and video including desktop and system audio
* parole - my preferred audio player
* mpv libva youtube-dl - my favorite multimedia player for playing online streaming content e. g. YouTube videos with HW acceleration
    - `libva` package helps to enable accelerated video playback through GPU by for VAAPI enabled drivers and GPU.
    - `youtube-dl` enables playing online videos and streams.
    
    - [MPV player - mouse and keyboard shortcuts](https://defkey.com/mpv-media-player-shortcuts)
    
    **Configuration**
    
    MPV configuration file is designed specificly for at most 1080p videos encoded in H264/AVC codec with best audio available.  
    Create the MPV configuration file...
    
        vim ~/.config/mpv/mpv.conf
        
    ... with this content [1](https://github.com/mpv-player/mpv/issues/2619#issuecomment-166200727), [2](https://hydrogenaud.io/index.php?topic=119836.msg989403#msg989403)
    
        ytdl-format=bestvideo[vcodec*=avc][height<=1080]+bestaudio/best
        
    For optimal performance and experience I recommend to also change the `1080` video height set according your display resolution, e. g. for 1440p / 2K displays it would be `[height<=1080]`
        
    [OPTIONAL] For playing 1440p 60fps on Intel HD 520 or equivalent GPU, you may use [this config](https://github.com/mpv-player/mpv/issues/2885#issuecomment-447684543) to avoid stuttering (tested on `libva-intel-driver-hybrid` with `intel-hybrid-codec-driver`, `LIBVA_DRIVER_NAME=i965`, early modesetting Intel driver `i915` with Guc/HuC enabled):
    
        ytdl-format=bestvideo[height<=1440]+bestaudio/best
        video-sync=display-resample
        interpolation=yes
        tscale=mitchell

    ... and then tested with a 60 fps video with this command:
    
        streamlink --verbose-player --player-no-close --player="mpv --hwdec=auto" https://www.youtube.com/watch?v=LXb3EKWsInQ 1440p60

    because playing the video with only...
    
        mpv --hwdec=auto https://www.youtube.com/watch?v=LXb3EKWsInQ
    
    ... didn't enable HW acceleration through VAAPI and used SW decoding which was stuttery. [Vulkan GPU API](https://mpv.io/manual/master/#options-gpu-api) didn't solve this issue either.
    
    Playing in `VLC` through `streamlink` was much smoother without additional configuration. VLC immediately used HW accelerated LIBVA driver. But unfortunately, VLC doesn't support seeking Youtube videos - as soon as I try to seek in Youtube videos in VLC, the player stops playing the video and it doesn't resume the playback even after pressing the 'Play' button.
    
        streamlink --verbose-player --player-no-close --player="vlc" https://www.youtube.com/watch?v=LXb3EKWsInQ 1440p60

    Sources:
        
    [Is it possible to set only a specific codec to play YouTube videos, for example, only H264?](https://hydrogenaud.io/index.php?topic=119836.msg989403#msg989403)
    
    [ytdl options](https://github.com/mpv-player/mpv/issues/2619)
    
    [mpv.conf - Argon-](https://github.com/Argon-/mpv-config/blob/master/mpv.conf)
    
    [mpv.conf - Ahjolinna](https://github.com/ahjolinna/mpv-conf/blob/master/mpv/etc/mpv.conf)
    
    ---
    
    **Playing media**
    
    I experimented with many options, e. g. rendering Vulkan, OpenGL, X11, different kinds of hardware acceleration and video output, fixing error messages in verbose output, but most benefitial of them was the option `--hwdec=auto`. With this option the media playback used the least CPU, was most stable and smooth, no tearing or stuttering. Therefore I run the MPV player with the command:
    
        mpv --hwdec=auto <multimedia_file_or_stream_URL>

* vlc - my preferred multimedia player for local files
    - Youtube network streaming fix
        
            # Go to the VLC directory
            cd /usr/lib/vlc/lua/playlist/
            
            # Backup the original script for youtube streaming
            sudo mv youtube.luac youtube.luac.bak
            
            # Download the fixed Youtube streaming plugin from the master branch ...
            sudo curl https://raw.githubusercontent.com/videolan/vlc/master/share/lua/playlist/youtube.lua --output youtube.lua
            # ... or directly from the commit I tested it from
            sudo curl https://raw.githubusercontent.com/videolan/vlc/8bbb13419d4bc5505cb75416d5b8049142a27358/share/lua/playlist/youtube.lua --output youtube.lua
            
        Sources:
        - [YouTube VLC Stream LUA Fix](https://www.youtube.com/watch?v=jg4Og5ra_F0)
        - [tested fixed script for youtube streaming](https://raw.githubusercontent.com/videolan/vlc/8bbb13419d4bc5505cb75416d5b8049142a27358/share/lua/playlist/youtube.lua)
        - [latest script for youtube streaming - master branch](https://raw.githubusercontent.com/videolan/vlc/master/share/lua/playlist/youtube.lua)
        
    - Disable cover art for audio files in normal mode
    
        Disable cover art in the playback panel by editing the VLC configuration file.  
        The VLC configuration file is located in:
        - Linux: `~/.config/vlc/vlcrc`
        - Windows: `%HOMEPATH\AppData\Roaming\vlc\vlcrc`
        
                $ sed -i 's/.*qt-bgcone=.*/qt-bgcone=0/' ~/.config/vlc/vlcrc
                $ #Source: https://forum.videolan.org/viewtopic.php?t=129402#p433995
    
    - Disable cover art for any file in playlist mode
    
        1. Show playlist by pressing _Ctrl + L_ or in _View - Playlist_
        1. Find the cover art panel. In my case it was in the bottom left corner.
        1. Drag the upper border of the cover art panel all the way down. This will hide the panel with the cover art, and leave the left menu panel visible.
    
    - Disable automatic window resizing and scaling
    
        - Disable variable window size in the VLC configuration file
    
                $ sed -i 's/.*qt-video-autoresize=.*/qt-video-autoresize=0/' ~/.config/vlc/vlcrc
            
            This will also uncheck the checkbox for _Tools - Preferences - Interface - Resize interface to video size_
            
            When it won't work, continue with the other options. Otherwise continue with next steps.
            
            Sources:
            - https://superuser.com/questions/368743/how-to-prevent-vlc-from-automatically-resizing-its-window-according-to-viewed-co/412290#412290
            - https://superuser.com/questions/368743/how-to-prevent-vlc-from-automatically-resizing-its-window-according-to-viewed-co/368759#368759
            
        - Tools - Preferences - Show settings (in bottom left corner): All - Video
        
            In _Window properties_ section uncheck _Video Auto Scaling_.
            
            Source: https://superuser.com/questions/368743/how-to-prevent-vlc-from-automatically-resizing-its-window-according-to-viewed-co/687776#687776
            
    - Specify default video resolution - useful for streams with multiple resolutions available
    
        1. Tools - Preferences - Show settings (in bottom left corner): All - Input / Codecs
        1. In _Track settings_ section find option _Preferred video resolution_. 
        1. Click on the drop-down menu
        1. Choose the preferred video resolution. I selected option _Full HD (1080p)_ because it matches with the resolution of my display.
        
        Sources:
        - https://www.quora.com/How-do-I-select-the-video-quality-in-VLC-while-playing-a-YouTube-stream
        
* streamlink - wrapper around other multimedia players - utility that forwards online streams of given quality to the chosen multimedia player
    - a way how to play online streams outsite the web browser
    - The main purpose of [Streamlink](https://streamlink.github.io/index.html#) is to avoid resource-heavy and unoptimized websites, while still allowing the user to enjoy various streamed content.

    Usage example:
    
    1. List formats for video (example)
        
            streamlink https://www.youtube.com/watch?v=LXb3EKWsInQ
                
    1. Play video with an player in selected quality
            
            streamlink --verbose-player --player-no-close --player="mpv --hwdec=auto" https://www.youtube.com/watch?v=LXb3EKWsInQ 1080p60
            
    Sometimes the stream crashes during playback pass add to the Streamlink's arguments `--player-no-close`. This will prevent premature closing of the player wiht error
    
            [mkv] EOF reached
            [cplayer] EOF code: 5
            
* minitube - my favorite player for playing videos in 1440p/2K/4K with lower GPU power consumption than hardware accelerated MPV `mpv --hwdec=auto`, but only at those higher video resolutions, i. e. 1440p+, and with hardware acceleration just like VNC.
    - it combines the advantages of MPV and VNC for smooth Youtube playback: seeking function from MPV and hardware acceleration from VNC

* chromium / (https://aur.archlinux.org/packages/ungoogled-chromium/)[ungoogled-chromium]: see (https://github.com/Eloston/ungoogled-chromium#enhancing-features)[ungoogled-chromium GitHub]
    - Maybe in the future I will try out [Chromium-VAAPI](https://aur.archlinux.org/packages/chromium-vaapi/) and see if it makes any difference when playing videos, e. g. lower CPU usage, hardware acceleration of videos through GPU, smoother - no stutter and tear-free - video playback.
    - [ungoogled-chromium for Android](https://uc.droidware.info/)
    - [Pinterest without log-in prompting](https://www.lifehacker.com.au/2015/05/this-tweak-lets-you-browse-pinterest-without-signing-up/)
        1. Install plugin `Tampermonkey` from https://chrome.google.com/webstore/detail/tampermonkey/dhdgffkkebhmkfjojejmpbldmpobfkfo/related
        1. Install script `Pinterest without registration` from https://greasyfork.org/en/scripts/6325-pinterest-without-registration
    - [Image Transparency - configurable background color for images with transparent background](https://chrome.google.com/webstore/detail/image-transparency/ihnkmjaflangdaififmekbjicpafmdek/related)
        - by default black, but text is also by default black so I don't see usually any text
        - Configuraion for white background: background color: 255, 254, 254; main color: 255, 255, 255; size = 1
        - background color 255, 255, 255 or even 255, 255, 254 in Chromium reverts back the default black color for transparent background images
    - uBlock Origin
        - [adfilter](https://raw.githubusercontent.com/DandelionSprout/adfilt/master/BrowseWebsitesWithoutLoggingIn.txt) - use for annoyances
    - Tab Suspender
        - prevents from loading tabs - tabs are loaded only when they're active; tabs are unloaded from memory after a time period
        - https://superuser.com/questions/811965/how-to-make-chrome-not-load-tabs-until-they-are-selected/883096#883096
        - 
        
    - **Enabling Hardware Acceleration for Chromium** - offloading strain from CPU to GPU for video decoding. [How can I make sure what capabilities my Intel GPU has?](https://bbs.archlinux.org/viewtopic.php?id=257178), https://www.reddit.com/r/linux/comments/k5s4n5/google_chrome_v88_got_hardwareaccelerated/
        - The way that uses least CPU of the various ways I tried out is to forward video playback to external multimedia player. In a dedicated multimedia player the CPU usage is lower and GPU usage higher, which is what I wanted. Videos play smooth, without stutter or tearing with GPU hardware acceleration.
        
            I tested VLC and MPV player. Both support GPU hardware acceleration for videos thourh VAAPI or VDPAU, according to what's enabled or preferred by the player.
            
            I tested **VLC player** through 'Send to VLC' extension on RTVS streams and YouTube streams, which played videos smoothly, but didn't offer the 'seeking' functionality - jumping back and forth in the video, and also VLC didn't support subtitles. RTVS streams could be played, but only from the  from the browser right from the extension, which I find very convenient. VLC doesn't support format and video quality choosing, it only plays the video or stream. Allegedly, the `fmt` parameter for YouTube URLs should enable the choosing of video quality, but it didn't work for me anyway. [1](https://www.reddit.com/r/VLC/comments/3mk8p5/vlc_seems_to_stream_youtube_only_in_720p_how_can/), [2](https://www.reddit.com/r/youtube/comments/3ijei1/how_to_watch_youtube_above_720p_dash_streams_in/cvi4bnx/?utm_source=reddit&utm_medium=web2x&context=3), [3](https://www.reddit.com/r/VLC/comments/aorvvm/how_can_i_play_this_youtube_video_in_1080p_in_vlc/ek7izf2/), [Possible fix/patch for video quality selection for VLC](https://trac.videolan.org/vlc/ticket/10237#no1)
            
            Then I tested **MPV player** with extension 'Watch with MPV', which played videos smoothly, and offers 'seeking' functionality - jumping back and forth in the video, and supports subtitles. MPV supports format and video quality choosing, but only statically through configuration file `~/.config/mpv.conf`
            
            **Streamlink + MPV/VLC**: combination that combines GPU hardware acceleration of MPV/VLC with the ability to choose the video or stream quality. It provides an alternative way of playing web streams outside of (usually) poorly and less efficient multimedia player in browsers. [Streamlink - Arch Wiki](https://wiki.archlinux.org/index.php/Streamlink), [Streamlink - Homepage](https://streamlink.github.io/index.html) [List of multimedia plugins and utilities](https://github.com/ahjolinna/mpv-conf), [streamlink usage](https://github.com/ahjolinna/mpv-conf#basic-features), [another streamlink usage](https://stackoverflow.com/questions/13439442/command-line-youtube-in-vlc-player-quality-control/55110722#55110722), [Streamlink - Usage examples](https://streamlink.github.io/cli.html#tutorial)
            
            For `streamlink` usage example, see the `streamlink` package description in this file.
                    
            ---
            
            To set up all of this, frst install extensions [Send to VLC (VideoLAN) media player](https://chrome.google.com/webstore/detail/send-to-vlc-videolan-medi/hfckgfbhdacemicpjljhfbjmkiggeche) and [Watch with MPV](https://chrome.google.com/webstore/detail/watch-with-mpv/gbgfakmgjoejbcffelendicfedkegllf) to Chromium browser.
            
            The extensions _Send to VLC (VideoLAN) media player_ and _Watch with MPV_ forward the requests from browser to the media player on the system through their native clients installed in the system. `watch-with-mpv` is a native client 
            
            **Forwarding videos from browser to MPV player**
            
            Install the `mpv` package with all dependencies, if any.
            
            ~~Install the native client for _Watch with MPV_ extension: `pikaur -Syy watch-with-mpv`~~ Not necessary but if the installation from repository doesn't work, installing and uninstalling it right away, or just installing it and leaving the package there this *before* installing from ther repository may make it work.
                
            Download the [forked repository](https://github.com/kyberdrb/watch-with-mpv) which has MPV with hardware acceleration enabled and install it on top of the already installed native client. [Follow these steps](https://github.com/kyberdrb/watch-with-mpv/blob/master/README.md#installing-from-source) to compile the native client by yourself on Linux.
            
            ~~This replaces the files installed by the package `watch-with-mpv` the native client for the extension.~~
            
            Make sure that you configured the `mpv` player according to your system abilities. For more information about configuration, see the description of the `mpv` package in this file.
            
            The video forwarding to the MPV player via native client is immediately functional and usable without reloading the site, restarting Chromium or restarting the computer.
            
            Test it (example). Go to e.g. [this page with a 1080p 60fps video](https://www.youtube.com/watch?v=LXb3EKWsInQ) pause the video and click the MPV icon in the top right corner. If the icon is not visible, pin it from the extension menu. The video will start to play in the MPV player. As a consequence, this solution provides less CPU and more GPU utilization, smooth and tear-free video playback. Overall, it's more efficient. Maybo not battery wise, but certainly utilization wise.
            
            To see how much the CPU is used use the `htop` utility. I've seen decreased CPU utilization from about 50 up to 80%. That way I know, that the hardware acceleration through GPU for videos works.
            
            ---
            
            **Forwarding videos on RTVS.sk from browser to a multimedia player (or Forwarding _anything copied_ from browser to _anything else_)** - best quality with hardware acceleration, one-mark or multiple-clicks-on-the-same-spot method , universal, (little annoying during testign)
            
            [Use Clipman to launch a script to launch a multimedia player with hardware acceleration](https://www.maketecheasier.com/open-youtube-video-vlc-clipman-linux/)
            
            Install Clipman
            
                sudo pacman -Syy xfce4-clipman-plugin 
            
            Create Bash script...
            
                cd
                vim external_browser_player.sh
                
            ... that will work with JSON data similar to this example...
            
                {
                   "request" : "Vmv8w47d",
                   "clip" : {
                      "mediaid" : 74456,
                      "sources" : [
                         {
                            "type" : "application/x-mpegurl",
                            "src" : "https://n2.stv.livebox.sk/stv-tv-arch/_definst_/smil:a510/00/0007/000744/00074456.smil/playlist.m3u8?auth=b64%3AYTUxMC8wMC8wMDA3LzAwMDc0NC8wMDA3NDQ1NnwxNjA5NzkyNTE4fDdkNWMwNDMyNTVjOWY5YjZlNzM0NTEyODM3NDI5NzJlZTRiODg4ZDU%3D"
                         },
                         {
                            "type" : "application/dash+xml",
                            "src" : "https://e8.stv.livebox.sk/stv-tv-arch/_definst_/smil:a510/00/0007/000744/00074456.smil/manifest.mpd?auth=b64%3AYTUxMC8wMC8wMDA3LzAwMDc0NC8wMDA3NDQ1NnwxNjA5NzkyNTE4fDdkNWMwNDMyNTVjOWY5YjZlNzM0NTEyODM3NDI5NzJlZTRiODg4ZDU%3D"
                         }
                      ],
                      "title" : "Pumpa",
                      "image" : "https://www.rtvs.sk/media/a501/image/file/2/0709/92fe.pumpa_jpg.jpg",
                      "backend" : "e1",
                      "description" : "Komediálny seriál reaguje na aktuálne udalosti predošlého týždňa cez trojicu svojských postáv. Mickey pracuje na benzínovej pumpe, kde za ním pravidelne chodí jeho bývalý spolužiak, taxikár Dano a málovravný štamgast Jari. Doma aj vo svete sa stále niečo deje a táto trojica má na to svoj vlastný názor.",
                      "datetime_create" : "2020-12-05 23:58",
                      "length" : "00:27:08"
                   }
                }
                
            ...so according to this input data, I came up with [this script](https://github.com/kyberdrb/Linux_utils_and_gists/blob/master/external_browser_player.sh).
            
            The script will extract only the video ID from the URL from the browser and open in a multimedia player with enabled hardware acceleration.
            
            Setup Clipman: click on the status icon in the panel and select `Clipman settings...`. Go to `Actions` tab, turn on `Enable automatic actions`, select `Skip actions by holding Control`, i. e. actions will pop up when we **select** (not copy) text that matches the pattern, and click the `+` sign to create a new action. This action will handle the RTVS URLs.
            
                Action
                Name: RTVS
                Pattern: .*rtvs.*
                
                Commands
                Name: RTVS Player
                Command: /home/laptop/git/kyberdrb/Linux_utils_and_gists/external_browser_player.sh \0
                
            Click OK to save the action. Close the settings window.
            
            Test the functionality on any [RTVS video](https://www.rtvs.sk/televizia/archiv/16350/251046). Mark the URL in the address bar or repeatedly click on the URL until it's marked entirely. The pop up menu should appear. Choose the `RTVS Player`. The multimedia player opens with the video.
            
            Clipman start automatically at startup by itself, so we have this comfort right after the installation.
            
            ---
            
            **Forwarding videos from browser to VLC player** - one-click option
            
            Install the  `vlc` package and all its dependencies, if any.
            
            Install the native client for _Send to VLC (VideoLAN) media player_ extension
            
            Download the native client from:
            
                https://github.com/belaviyo/native-client/releases
                
            example for Linux-based operating systems:
            
                mkdir ~/Downloads
                cd Downloads
                curl -L https://github.com/belaviyo/native-client/releases/download/0.4.6/linux.zip -oSend_to_VLC-native_client.zip
                
            You can also clone the git repo with `mkdir -p ~/git && cd ~/git && git clone https://github.com/belaviyo/native-client.git && cd native-client`, but it's approximately two times bigger, because it's not compressed and it's so big because it contains `node` binaries, which the installation script relies on.
                
            Install the native client
            
                unzip Send_to_VLC-native_client.zip -d "Send_to_VLC-native_client"
                cd Send_to_VLC-native_client
                ./install.sh
                
            The native client is ready for use immediately after installation.
            
            Test the plugin by navigating to any video on [RTVS](https://www.rtvs.sk/televizia/archiv/16350/251893) or [YouTube](https://www.youtube.com/watch?v=LXb3EKWsInQ), mute the video (for convenience later), start the video, pause the video. This initializes the plugin when it's forwarding video from the RTVS site - numbers may to appear at the extension's icon in the top right corner. If the icon is not diplayed there, pin it from the extensions menu. Click on the extension's icon. The video begins to play in VLC player.
                
            The limitation of this method is that the VLC can only play online youtube streams at 720p resolution. Here is a [description of the bug](https://trac.videolan.org/vlc/ticket/10237#no1) and a [possible patch](https://trac.videolan.org/vlc/attachment/ticket/10237/dash.patch) for that.
            
        - Check if the changes make effect at:
            - chrome://gpu/ - checking the status of `Graphics Feature Status`
            - chrome://media-internals/ - checking, whether the videos are accelerated through GPU `MojoVideoDecoder`
            - Source: https://bbs.archlinux.org/viewtopic.php?id=244031
        - Edit `~/.config/chromium-flags.conf`. For reasons why to edit this, see [README](https://github.com/kyberdrb/Linux_utils_and_gists/blob/master/Chromium_modified_flags-HW_GPU_acceleration-performance/README.md).
            - Example (excerpts)
                - [`chromium-flags.conf` for AMDGPU](https://github.com/kyberdrb/Linux_utils_and_gists/blob/master/Chromium_modified_flags-HW_GPU_acceleration-performance/chromium-flags.conf.amd_gpu)
                - [`chromium-flags.conf` for Intel GPU](https://github.com/kyberdrb/Linux_utils_and_gists/blob/master/Chromium_modified_flags-HW_GPU_acceleration-performance/chromium-flags.conf.intel_gpu)
                
        - install plugin [`enhanced-h264ify`](https://chrome.google.com/webstore/detail/enhanced-h264ify/omkfmpieigblcllmkgbflkikinpkodlk) - HW acceleration for Youtube videos - better smoothness of videos + video tearing fix [Hardware Acceleration In Chromium](https://www.linuxuprising.com/2018/08/how-to-enable-hardware-accelerated.html)
        - [`chrome://flags/`](chrome://flags/)
            - Override software rendering list: #ignore-gpu-blocklist
                - Enables `Hardware Protected Video Decode: Hardware accelerated` in `chrome://gpu`
            - Enable Reader Mode: #enable-reader-mode
                - not related to GPU video acceleration but it ...
                - ... force enables reader mode for all pages without ads and other distractions, because reader mode helps me to focus on the article.
            - GPU rasterization: #enable-gpu-rasterization
                - Enables `Rasterization: Hardware accelerated on all pages` in `chrome://gpu`
            - Hardware-accelerated video decode: #enable-accelerated-video-decode
                - Enables `Video Decode: Hardware accelerated` in `chrome://gpu`
            - I only mentioned the most essential flags. Try to enable more flags by [Modified chromium flags for desktop and mobile](https://github.com/kyberdrb/Linux_utils_and_gists/tree/master/Chromium_modified_flags-HW_GPU_acceleration-performance) and see how stable and effective they are.
            - I didn't enable the `Vulkan` decoding because it resulted in having white video screen on Youtube with videos using `h264` codecs which are hardware accelerated by GPU. This didn't happen when the video was decoded with VP8 or VP9 formats which are unfortunately decoded by CPU.
            - Sources: https://www.lifewire.com/hardware-acceleration-in-chrome-4125122
            
        - check HW acceleration for videos at `chrome://media-internals/`. Look for `MojoVideoDecoder` which indicates that the video is decoded using hardware acceleration through GPU
            - [chromium: hardware video acceleration with VA-API](https://bbs.archlinux.org/viewtopic.php?id=244031)
        
* firefox
    - in the upper right corner click on a hamburger icon with a label `Open menu`
    - click on `Preferences`
    - Tab `General`
        - check `Restore previous session`
        - uncheck `Ctrl+Tab cycles through tabs in recently used order`
    - Extensions
        - uBlock Origin - see `uBlock Origin` setup somewhere here
    - Enable hardware acceleration TODO
        - OpenGL/WebGL and VAAPI
        
* redshift-minimal -> color temperature changer (spares eyes) -> run on background in tray with "redshift&"
    - Create environment for the config file
    
            mkdir -p ~/.config/redshift/
            cd ~/.config/redshift/
            vim redshift.conf
    
    - Sample `redshift.conf`
    
            [redshift]
            temp-day=2600
            temp-night=2600
            fade=0
            gamma=0.8
            location-provider=manual
            adjustment-method=randr

            [manual]
            lat=48
            lon=11

            [randr]
            screen=0
            
    - Add to autostart XFCE4 if you want in `Applications -> Settings -> Session and Startup -> Application autostart`. Set command as `redshift &`. I assume that the configuration file is present and correct.

    - Sources
        - [Redshift config file location](https://wiki.archlinux.org/index.php/Redshift#Configuration)
        - [Sample redshift config file](https://github.com/jonls/redshift/blob/master/redshift.conf.sample)
        - If you want to create the config file from scratch
            - [`cp redshift.conf redshift.conf.original && sed -e '/^;/d' redshift.conf.original > redshift.conf.config_with_removed_comments`](https://unix.stackexchange.com/questions/13525/sed-one-liner-to-delete-any-line-that-begins-with-a-digit/13526#13526)
            - [`sed '/^$/d' redshift.conf.config_with_removed_comments > redshift.conf` - then open the file manually and insert a new line before each section for better readability](https://www.cyberciti.biz/faq/using-sed-to-delete-empty-lines/)

---

* virtualbox virtualbox-ext-oracle virtualbox-guest-iso
    - choose the option 
        - `virtualbox-host-modules-arch`, if you have the default arch kernel, ...  
            ... but if you have any custom kernel installed, like `linux-pf` use the package `virtualbox-host-dkms` see https://wiki.archlinux.org/index.php/VirtualBox#Install_the_core_packages
        - if you install, or forget to install, the compatible package matching the kernel type, the virtualbox virtual machine will fail to start with an error message. [https://bbs.archlinux.org/viewtopic.php?id=258955](The VirtualBox Linux kernel driver is either not loaded or not set up correctly.)
    - after installation add the user to the VirtualBox group. This allows for USB mounting for the virtual machine
    
            sudo gpasswd -a $USER vboxusers
            
        Source: https://wiki.archlinux.org/index.php/VirtualBox#Accessing_host_USB_devices_in_guest    
        
    - reboot
            
            reboot
          
* intel-gpu-tools - provides `intel-gpu-top` Intel GPU utilization monitor - run as `sudo intel-gpu-top`
    - only useful if you have an Intel GPU

---

* whonix - not an utiity, but an entire operating system for anonymous internet browsing
    - I [downloaded](https://www.whonix.org/wiki/Download) and set up the VirtualBox images of [CLI](https://www.whonix.org/wiki/VirtualBox/CLI) version for the Gateway and [XFCE](https://www.whonix.org/wiki/VirtualBox/XFCE) version for the workstation, imported images into VirtualBox, and deleted the rest, i. e. CLI Workstation and XFCE Gateway
    - inspired by [Qubes OS](https://www.qubes-os.org/intro/) and [Tor vs VPN](https://blokt.com/guides/tor-vs-vpn)
    
* gnaural gnaural-presets - binaural beats generator; check the research how and in what circumstances binaural therapy works
    - To add more presets:
        1. Download all presets from https://sourceforge.net/projects/gnaural/files/Presets/Mindstates/android/
        1. Move downloaded presets to gnaural directory for presets:
        
                sudo mv ~/Downloads/*.gnaural /usr/share/gnaural/presets/
                
        1. Open `gnaural`
        1. To open a preset, go to File - Open From Preset Library
        1. Select desired preset.
        1. Listen to it by pressing `Play` (as if it wouldn't be obvious :P )
        
* **p7zip**/peazip-qt-bin - 7z archive creation and extraction utility / 7z GUI wrapper
    - use `peazip` for maximum compression rate: https://peazip.github.io/maximum-compression-benchmark.html
* evince/**okular ebook-tools**
    - PDF readers
    - Evince (GTK)
    - Okular (Qt) (my preferred option - more features)
        - backend: **phonon-qt5-gstreamer**/phonon-qt5-vlc
            - https://www.reddit.com/r/kde/comments/5w9wty/gstreamer_or_vlc_as_phonon_backend/
            - https://wiki.archlinux.org/index.php/KDE#Which_backend_should_I_choose.3F
        - Text-to-Speech packages: `espeak-ng 1.49.2-6 speech-dispatcher 0.9.1-1`
            - TTS: https://bugs.archlinux.org/task/62629
        - `ebook-tools` adds support to okular for ebooks in `epub` format
            - https://bbs.archlinux.org/viewtopic.php?pid=1418697#p1418697
            
* ocrmypdf tesseract-data-eng tesseract-data-slk tesseract-data-dan tesseract-data-ces tesseract-data-deu - utility to make a PDF document searchable with trained datasets for the `tesseract` utility; 
    - trained datasets are stored in firectory `/usr/share/tessdata/`
    - A document is unsearchable, if it's composed of images, or the text cannot be searched, e.g. by `Ctrl + F`, or text cannot by selected
    - The command to make a PDF document searchable
    
            ocrmypdf --verbose --language eng --sidecar -O 0 --png-quality 100 --force-ocr document_in_english-nonsearchable.pdf document_in_english-searchable.pdf
            ocrmypdf --verbose --language eng -O 1 --png-quality 100 document_in_english-nonsearchable.pdf document_in_english-searchable.pdf
            
        - The `--language` option explicitely specifies the dataset that will be used for OCR (Optical Character Recognition); e.g. for `eng` it will use the  `tesseract-data-eng` dataset, i.e. the dataset for English language.
        - The `-O` option optimizes the final document. With value `1` the utility performs lossless optimizations which affect the size of the final document.
        - `sidecar` outputs the decoded text into a separate `txt` file
    
    - Sources
        - https://unix.stackexchange.com/questions/301318/how-to-ocr-a-pdf-file-and-get-the-text-stored-within-the-pdf/421686#421686
        - https://aur.archlinux.org/packages/ocrmypdf/
        - https://ocrmypdf.readthedocs.io/en/latest/jbig2.html#jbig2
        - https://aur.archlinux.org/packages/jbig2enc-git/
        - https://www.archlinux.org/packages/?sort=&q=tesseract-data&maintainer=&flagged=
        - https://stackoverflow.com/questions/39037823/tesseract-data-language-codes-with-country-name/39040220#39040220
        - https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
        - https://www.archlinux.org/packages/community/any/tesseract-data-eng/
        - https://www.archlinux.org/packages/community/any/tesseract-data-slk/
        - https://www.archlinux.org/packages/community/any/tesseract-data-dan/
        - `ocrmypdf --help`
- jbig2enc-git - optional dependency for `ocrmypdf` utility - takes advantage of the lossy compression to JPEG image format in order to reduce the size of the final document to the minimum
* pocketsphinx - audio transcription
    - Usage
            pocketsphinx_continuous -time yes -infile file.wav 2> pocketsphinx.log > subtitle_file.txt

        1. convert the file to the compatible format: audio rate 16kHz [-ar], mono (1 audio channel [-ac])

                ffmpeg -i audio.mp3 -ar 16000 -ac 1 audio.wav
            
        - Generate Speech to Text for audio files without timestamps

                pocketsphinx_continuous -infile audio.wav 2> pocketsphinx.log > audio.txt
            
        - Generate Speech to Text for audio files with timestamps (for better orientation in original/source media)

                pocketsphinx_continuous -time yes -infile audio.wav 2> pocketsphinx.log > audio-with_timestamps.txt
        
        The english language model is installed by default. More language models can be found in https://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/. Then move the model to `/usr/share/pocketsphinx/model/`
        
    - Source
        - https://askubuntu.com/questions/837408/convert-speech-mp3-audio-files-to-text/1030253#1030253
    
* libreoffice-still - office suite
* ntfs-3g -> NTFS support
* gvfs -> enables Trash icon/functionality (trash virtual file system) and automatic mounting of system drives
* **gvfs-mtp** gvfs-gphoto2
    - automouning MTP devices, such as smartphones + automounting PTP devices, such as cameras
    - issue the command below to mount all MTP devices
    
            gio mount -li | awk -F= '{if(index($2,"mtp") == 1)system("gio mount "$2)}'
            
        All MTP devices will be mounted in their respective directories in `/run/user/$UID/gvfs/`, e.g. `/run/user/1000/gvfs/`
        
    - reboot
        
        Source: https://wiki.archlinux.org/index.php/Media_Transfer_Protocol#gvfs-mtp

* make cmake gdb lldb libc++ gtest perf valgrind - C/C++ toolchain; `libc++`is a C++ standard library for LLVM
* clion clion-cmake clion-gdb clion-jre clion-lldb - C/C++ IDE from JetBrains with bundled toolchains and Google Test Framework; all packages must be installed to have a fully functional IDE
    - perf - profiling tool for Linux kernel; useful for CLion; set it up in CLion under "File -> Settings -> Build, Execution, Deployment -> Dynamic analysis tools" - run profiler via "Run -> Profile '<ProjectName>'"
    - valgrind - memory leaks test; useful for CLion; set it up in CLion under "File -> Settings -> Build, Execution, Deployment -> Dynamic analysis tools" - run Valgrind via "Run -> Run '<ProjectName>' with Valgrind Memcheck"
    - gdb: I chose to disable colors in the GDB because I found some words harder to read on Terminal with black background, e.g. the `auto` keyword which was blue. Therefore, I created a file `~/.gdbinit` with this content
    
            set style enabled off
            
        The setting will be loaded for each gdb session, unless a project-specific configuration file for GDB is present in the directory of the project, which is the directory where we'll be launching the GDB utility.
    
        - Sources:
            - https://sourceware.org/gdb/current/onlinedocs/gdb/Output-Styling.html
            - https://stackoverflow.com/questions/2045509/how-to-save-settings-in-gdb/2045532#2045532
            - https://github.com/gdbinit/Gdbinit/blob/master/gdbinit
* qtcreator - IDE for Qt Framework
* python-pip - pip package installer
    
---

* musescore - music notation software. For development, uninstall `musescore` package via `sudo pacman -R musescore`. This will leave only one copy of the application installed on the system when we build it. The dependent packages will still remain present which will be helpful when compiling the application. For `musescore` dependencies see the [Arch-Based OS Compilation Instructions](https://musescore.org/en/handbook/developers-handbook/compilation/compile-instructions-archlinux-based-distros-git)
* doxygen - documentation generator for software projects; UML and text docs
* graphviz - utility for graphically generating UML diagrams

---

* parallel - utility for parallel execution of commands
* ttf-vlgothic - Japanese font to support Japanese characters in the operating system and apps like webbrowsers etc.; https://wiki.archlinux.de/title/Schriftarten
* xclip - terminal clipboard manipulation utility

---

* parallel - parallelize shell commands
* thunar - favorite file manager
* transmission-gtk / transmission-qt -> torrent klient
* gparted  exfatprogs - disk and partition manager
* xorg-apps - additional utilities for easier Xorg management e.g. brightness adjustment etc.
* picom - compositor with hardware acceleration through OpenGL
    - to set it up for LXDE (or maybe other environments), follow the guide [for fixing the tearing and stuttering](https://github.com/kyberdrb/Linux_tutorials/blob/master/LXDE-Fix_tearing_with_compositor.md)
    - lighter than compiz, newer and easier to setup than compton
* audacity pulseaudio-alsa -> audio editing software
    * [https://bbs.archlinux.org/viewtopic.php?pid=1639294#p1639294](SOLVED]No sound in Audacity)
    * [https://www.archlinux.org/packages/extra/x86_64/pulseaudio-alsa/](pulseaudio-alsa - archlinux)
    * [https://forum.audacityteam.org/viewtopic.php?t=98318#p344598](remove vocal from a song - No "Mono" option for each track - Audacity Forum)

---

* dmidecode - RAM info
    - installation of this utility solves/removes the error message in `journalctl`: `libvirtd[568]: Cannot find 'dmidecode' in path: No such file or directory`
* dcfldd - safe `dd`
* lxqt - LXQt desktop environment
    - REMOVE `pcmanfm-qt` and replace it by `thunar` as a file manager
* filezilla -> FTP client
* mousepad -> po instalacii otvorit mousepad, ist do Edit->Preferences->View->Colour scheme->Cobalt (biele pismena na ciernom pozadi)
* bluez bluez-utils blueman pulseaudio-bluetooth - enable Bluetooth support
    - `pulseaudio-bluetooth` adds support for Bluetooth audio devices. Installation of this package resolves the error in Blueman `Connection Failed:  Protocol not available` when connencting to a bluetooth audio device. Load the bluetooth audio modules at runtime via `pactl` or reboot the system. `pactl` commands:

            pactl unload-module module-bluetooth-discover
            pactl load-module module-bluetooth-discover
            pactl unload-module module-bluetooth-policy
            pactl load-module module-bluetooth-policy
            
        To make the changes persistent and load the bluetooth audio modules at each pulseaudio server start, run `sudo vim /etc/pulse/system.pa` and add/append these lines:
        
            ### Enable Bluetooth audio devices
            load-module module-bluetooth-policy
            load-module module-bluetooth-discover

        Test the Bluetooth audio device

        1. Enable Bluetooth. Connect to the bluetooth device via Blueman applet.
        1. Start playing some audio stream.
        1. The audio will start playing from the Bluetooth device.
        1. If audio doesn't play from the bluetooth device, but instead plays from the original output, open the `Audio mixer...` from the `Volume applet` in the taskbar.
        1. Go to the `Output Devices` tab and click on the green checkmark icon in the section of the bluetooth device. This makes the Bluetooth audio device the **default** audio device. This allows for adjusting the volume of the Bluetooth audio device, as opposed to only switching it on the `Playback` tab.
        - Sources:
            - https://wiki.archlinux.org/index.php/Blueman
            - https://askubuntu.com/questions/1115671/blueman-protocol-not-available/1171274#1171274
            - https://wiki.archlinux.org/index.php/Bluetooth#PulseAudio

* fwupd - updates BIOS and UEFI and other device's firmware from Linux, if the device is supported

openvswitch -> virtual switch for bridging VMs and containers

dnsmasq -> internet connectivity support tool for LXC NAT bridge interface

wireguard - open-source VPN platform

soundwire pulseaudio-alsa lib32-libpulse lib32-alsa-plugins - SoundWire and its dependencies; enables the use of an Android phone as a wireless speaker; Configuration: open _PulseAudio_ GUI `pavucontrol[-qt]` -\> Recording tab -\> ALSA Capture from `Monitor of Built-in Audio Analog Stereo`

* qemu qemu-arch-extra virt-manager ebtables dnsmasq bridge-utils edk2-ovmf -> generic virtualizer
    - `libvirt` - GUI
    - `dnsmasq` - internet connection sharing with the virtual machine, i.e. with the _guest_ system
    - `edk2-ovmf` - UEFI support
    - Configuration:
        
            sudo systemctl enable libvirtd.service
            sudo systemctl start libvirtd.service
            sudo vim /etc/conf.d/libvirtd
    - Path to virtual disks: `/var/lib/libvirt/images`
    - Sources
        - https://wiki.archlinux.org/index.php/Libvirt
        - https://wiki.archlinux.org/index.php/KVM
        - https://wiki.archlinux.org/index.php/QEMU
        - https://wiki.archlinux.org/index.php/Libvirt#Client
        - https://wiki.archlinux.org/index.php/Libvirt#UEFI_Support
        - https://wiki.archlinux.org/index.php/Libvirt#Server

shotwell -> image viewer with nice features (crop, rotate, ...)

tigervnc -> VNC client and server

tmux -> Terminal MUltipleXor - watch multiple terminals in one SSH session

tk -> tkinter library for Python

unrar -> needed for dtrx to extract RAR archives

virt-manager -> front-end ku QEMU

wget -> terminal downloader utility

xfce4

xfce4-pulseaudio-plugin -> Volume control in notification tray

xfce4-screenshooter -> Screenshots for XFCE; to enable PrintScreen key go to Application Menu -> Keyboard -> Application Shortcuts tab -> Add button -> as command enter "xfce4-screenshooter" without quotes -> as key press "PrintScreen (PrtSc)" key.

xfce4-xkb-plugin -> Keyboard layout changer in notification tray

---

bc- > command line calculator => set default scale (decimal precision) - https://askubuntu.com/questions/621017/how-to-set-default-scale-for-bc-calculator
blueman -> then execute: su -c 'systemctl enable bluetooth.service' -> this will enable the Bluetooth icon in notification tray

android-file-transfer - transfer data with a mobile device via MTP
android-tools - Android platform tools; `adb` etc.; make sure to have "USB Debugging" activated on Android device otherwise it will be hidden from `adb devices` command

iw -> Sprava bezdrotovych adapterov (skenovanie Wi-Fi sieti)

wireshark-qt - network traffic inspector

-VIRTUALIZATION

lxc -> base LXC support

arch-install-scripts -> base LXC support

debootstrap -> support for Debian based LXC containers in Arch Linux

docker -> base Docker support

---

dtrx -> command line extraction utility

etcher -> bootable USB creator; replacement for dd

* otf-sans-forgetica - font for better memorizing; setup for XFCE4: https://docs.xfce.org/xfce/xfce4-settings/appearance#fonts; setup for Chromium: https://www.techadvisor.co.uk/how-to/software/how-change-font-in-google-chrome-3606119/

teamviewer -> na ovladanie vzdialenych ploch - aj pre android :D (https://crazytechtricks.com/remote-control-android-phone-from-another-android-without-root-download-best-apps/)

---

-DEVELOPMENT

intel-compute-runtime ocl-icd lib32-ocl-icd opencl-headers - OpenCL runtime, loader, library and headers for GPGPU development and usage (Specific for Intel GPU). To set up OpenCL for other GPU vendors, see the [Arch Wiki -GPGPU](https://wiki.archlinux.org/index.php/GPGPU)

pycharm-professional -> Python/HTML/CSS/JS IDE from JetBrains; the community edition is good, but is lacking the "code coverage" functionality; needs to be activated - use one of the "jetbrains activation servers" << google that ;) or http://xidea.online/servers.html

mono - c# support for linux - see "https://wiki.archlinux.org/index.php/mono" for compilation and run instructions

python -> python3 support

python-xdg -> dependency for redshift-gtk (tray icon) to launch and run correctly

python-virtualenv python2-virtualenv -> virtualne prostredia pre python2 a python3

python-coverage python2-coverage: For support code coverage measurement for Python 2

---

-LXC/LXD containers support

yum -> support for Fedora based LXC containers in Arch Linux

lxd -> base LXD support

---

**  MANUALNE Z INTERNETU **

pycharm -> skopirovat do /opt adresara

vmware -> bud player alebo workstation

---

Sources:

XFCE Screenshot utility - https://ubuntuforums.org/showthread.php?t=1716649

SoundWire - https://bbs.archlinux.org/viewtopic.php?pid=1514780#p1514780

