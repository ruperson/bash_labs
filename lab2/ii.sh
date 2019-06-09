inf="\(II\)"
war="\(WW\)"
grep -E -h -s $war Xorg.0.log | sed -E "s/$war/Warning:/" > full.log
grep -E -h -s $inf Xorg.0.log | sed -E "s/$inf/Information:/" >> full.log
