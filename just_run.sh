#!/usr/bin/env sh

# Enviroment variables
NERDFONTVERS=v2.1.0


# Prepare original fonts from official release
unzip Cartograph*.zip
rm -R -f __MACOSX
mv Cartograph*CF*OTF otf
rm -f ./otf/*.pdf

# Get and prepare NerdFonts Patcher
curl -L https://raw.githubusercontent.com/ryanoasis/nerd-fonts/${NERDFONTVERS}/font-patcher --output font-patcher
patch font-patcher 0001*.patch

# Download source fonts for NerdFonts
mkdir -p src/glyphs
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/FontAwesome.otf?raw=true --output src/glyphs/FontAwesome.otf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/NerdFontsSymbols%201000%20EM%20Nerd%20Font%20Complete%20Blank.sfd?raw=true --output "src/glyphs/NerdFontsSymbols 1000 EM Nerd Font Complete Blank.sfd"
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/NerdFontsSymbols%202048%20EM%20Nerd%20Font%20Complete%20Blank.sfd?raw=true --output "src/glyphs/NerdFontsSymbols 2048 EM Nerd Font Complete Blank.sfd"
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/Pomicons.otf?raw=true --output src/glyphs/Pomicons.otf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/PowerlineExtraSymbols.otf?raw=true --output src/glyphs/PowerlineExtraSymbols.otf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/PowerlineSymbols.otf?raw=true --output src/glyphs/PowerlineSymbols.otf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/Symbols%20Template%201000%20em.ttf?raw=true --output "src/glyphs/Symbols Template 1000 em.ttf"
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/Symbols%20Template%202048%20em.ttf?raw=true --output "src/glyphs/Symbols Template 2048 em.ttf"
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/Symbols-1000-em%20Nerd%20Font%20Complete.ttf?raw=true --output "src/glyphs/Symbols-1000-em Nerd Font Complete.ttf"
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/Symbols-2048-em%20Nerd%20Font%20Complete.ttf?raw=true --output "src/glyphs/Symbols-2048-em Nerd Font Complete.ttf"
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/Unicode_IEC_symbol_font.otf?raw=true --output src/glyphs/Unicode_IEC_symbol_font.otf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/devicons.ttf?raw=true --output src/glyphs/devicons.ttf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/font-awesome-extension.ttf?raw=true --output src/glyphs/font-awesome-extension.ttf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/font-logos.ttf?raw=true --output src/glyphs/font-logos.ttf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/materialdesignicons-webfont.ttf?raw=true --output src/glyphs/materialdesignicons-webfont.ttf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/octicons.ttf?raw=true --output src/glyphs/octicons.ttf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/original-source.otf?raw=true --output src/glyphs/original-source.otf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/glyphs/weathericons-regular-webfont.ttf?raw=true --output src/glyphs/weathericons-regular-webfont.ttf
curl -L https://github.com/ryanoasis/nerd-fonts/blob/${NERDFONTVERS}/src/unpatched-fonts/Hack/Regular/Hack-Regular.ttf?raw=true --output src/glyphs/Hack-Regular.ttf

# Extract additional PowerLine glyphs
fontforge -lang=ff -script extract-extra-glyphs

# Build patched fonts
./do_generate 01 -c -c CartographCF-Bold.otf                   XCartographCF-Bold.otf             "XCartographCF"
./do_generate 02 -c -c CartographCF-BoldItalic.otf             XCartographCF-BoldItalic.otf       "XCartographCF"
./do_generate 03 -c -c CartographCF-DemiBold.otf               XCartographCFDemiBold.otf          "XCartographCF"
./do_generate 04 -c -c CartographCF-DemiBoldItalic.otf         XCartographCFDemiBold-Italic.otf   "XCartographCF"
./do_generate 05 -c -c CartographCF-ExtraBold.otf              XCartographCFExtraBold.otf         "XCartographCF"
./do_generate 06 -c -c CartographCF-ExtraBoldItalic.otf        XCartographCFExtraBold-Italic.otf  "XCartographCF"
./do_generate 07 -c -c CartographCF-ExtraLight.otf             XCartographCFExtraLight.otf        "XCartographCF"
./do_generate 08 -c -c CartographCF-ExtraLightItalic.otf       XCartographCFExtraLight-Italic.otf "XCartographCF"
./do_generate 09 -c -c CartographCF-Heavy.otf                  XCartographCFHeavy.otf             "XCartographCF"
./do_generate 10 -c -c CartographCF-HeavyItalic.otf            XCartographCFHeavy-Italic.otf      "XCartographCF"
./do_generate 11 -c -c CartographCF-Light.otf                  XCartographCFLight.otf             "XCartographCF"
./do_generate 12 -c -c CartographCF-LightItalic.otf            XCartographCFLight-Italic.otf      "XCartographCF"
./do_generate 13 -c -c CartographCF-Regular.otf                XCartographCF.otf                  "XCartographCF"
./do_generate 14 -c -c CartographCF-RegularItalic.otf          XCartographCF-Italic.otf           "XCartographCF"
./do_generate 15 -c -c CartographCF-Thin.otf                   XCartographCFThin.otf              "XCartographCF"
./do_generate 16 -c -c CartographCF-ThinItalic.otf             XCartographCFThin-Italic.otf       "XCartographCF"

# Rename (some) patched fonts for compliance
mv XCartographCF-Bold.otf XCartographCF-Bold.otf
mv XCartographCF-BoldItalic.otf XCartographCF-BoldItalic.otf
mv XCartographCFDemiBold.otf XCartographCF-DemiBold.otf
mv XCartographCFDemiBold-Italic.otf XCartographCF-DemiBoldItalic.otf
mv XCartographCFExtraBold.otf XCartographCF-ExtraBold.otf
mv XCartographCFExtraBold-Italic.otf XCartographCF-ExtraBoldItalic.otf
mv XCartographCFExtraLight.otf XCartographCF-ExtraLight.otf
mv XCartographCFExtraLight-Italic.otf XCartographCF-ExtraLightItalic.otf
mv XCartographCFHeavy.otf XCartographCF-Heavy.otf
mv XCartographCFHeavy-Italic.otf XCartographCF-HeavyItalic.otf
mv XCartographCFLight.otf XCartographCF-Light.otf
mv XCartographCFLight-Italic.otf XCartographCF-LightItalic.otf
mv XCartographCF.otf XCartographCF-Regular.otf
mv XCartographCF-Italic.otf XCartographCF-RegularItalic.otf
mv XCartographCFThin.otf XCartographCF-Thin.otf
mv XCartographCFThin-Italic.otf XCartographCF-ThinItalic.otf

# Cleanup
rm -R -f ./otf/
rm -f ./Cartograph*.otf

# Prepare release
mkdir xcartographcf
mv *.otf xcartographcf
zip xcartographcf.zip xcartographcf/*
