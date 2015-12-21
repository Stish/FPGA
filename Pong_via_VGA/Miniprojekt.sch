<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="R8" />
        <signal name="P6" />
        <signal name="U4" />
        <signal name="T4" />
        <signal name="U3" />
        <signal name="XLXN_1" />
        <signal name="B8" />
        <signal name="XLXN_2" />
        <signal name="l_up" />
        <signal name="l_down" />
        <signal name="r_up" />
        <signal name="r_down" />
        <signal name="start" />
        <port polarity="Output" name="R8" />
        <port polarity="Output" name="P6" />
        <port polarity="Output" name="U4" />
        <port polarity="Output" name="T4" />
        <port polarity="Output" name="U3" />
        <port polarity="Input" name="B8" />
        <port polarity="Input" name="l_up" />
        <port polarity="Input" name="l_down" />
        <port polarity="Input" name="r_up" />
        <port polarity="Input" name="r_down" />
        <port polarity="Input" name="start" />
        <blockdef name="vgatest">
            <timestamp>2011-1-4T21:23:8</timestamp>
            <line x2="0" y1="352" y2="352" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-320" height="704" />
        </blockdef>
        <blockdef name="Clk_div_2">
            <timestamp>2010-12-25T20:39:33</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="clk_div_ctrl">
            <timestamp>2010-12-29T17:42:50</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="vgatest" name="XLXI_2">
            <blockpin signalname="XLXN_1" name="clock" />
            <blockpin signalname="XLXN_2" name="clk_ctrl" />
            <blockpin signalname="l_up" name="left_up" />
            <blockpin signalname="l_down" name="left_down" />
            <blockpin signalname="r_up" name="right_up" />
            <blockpin signalname="r_down" name="right_down" />
            <blockpin signalname="R8" name="R" />
            <blockpin signalname="P6" name="G" />
            <blockpin signalname="U4" name="B" />
            <blockpin signalname="T4" name="H" />
            <blockpin signalname="U3" name="V" />
            <blockpin signalname="start" name="start" />
        </block>
        <block symbolname="Clk_div_2" name="XLXI_3">
            <blockpin signalname="B8" name="Clk_in" />
            <blockpin signalname="XLXN_1" name="Clk_out" />
        </block>
        <block symbolname="clk_div_ctrl" name="XLXI_4">
            <blockpin signalname="B8" name="clk_50mhz" />
            <blockpin signalname="XLXN_2" name="clk_ctrl" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="R8">
            <wire x2="2064" y1="480" y2="480" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="2064" y="480" name="R8" orien="R0" />
        <branch name="P6">
            <wire x2="2064" y1="544" y2="544" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="2064" y="544" name="P6" orien="R0" />
        <branch name="U4">
            <wire x2="2064" y1="608" y2="608" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="2064" y="608" name="U4" orien="R0" />
        <branch name="T4">
            <wire x2="2064" y1="672" y2="672" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="2064" y="672" name="T4" orien="R0" />
        <branch name="U3">
            <wire x2="2064" y1="736" y2="736" x1="1584" />
        </branch>
        <iomarker fontsize="28" x="2064" y="736" name="U3" orien="R0" />
        <instance x="1200" y="768" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1200" y1="480" y2="480" x1="1168" />
        </branch>
        <instance x="784" y="512" name="XLXI_3" orien="R0">
        </instance>
        <branch name="B8">
            <wire x2="752" y1="480" y2="480" x1="672" />
            <wire x2="768" y1="480" y2="480" x1="752" />
            <wire x2="784" y1="480" y2="480" x1="768" />
            <wire x2="752" y1="480" y2="800" x1="752" />
            <wire x2="784" y1="800" y2="800" x1="752" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1200" y1="800" y2="800" x1="1168" />
        </branch>
        <instance x="784" y="832" name="XLXI_4" orien="R0">
        </instance>
        <iomarker fontsize="28" x="672" y="480" name="B8" orien="R180" />
        <branch name="l_up">
            <wire x2="1184" y1="864" y2="864" x1="1136" />
            <wire x2="1200" y1="864" y2="864" x1="1184" />
        </branch>
        <branch name="l_down">
            <wire x2="1200" y1="928" y2="928" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="1168" y="928" name="l_down" orien="R180" />
        <branch name="r_up">
            <wire x2="1184" y1="992" y2="992" x1="1136" />
            <wire x2="1200" y1="992" y2="992" x1="1184" />
        </branch>
        <branch name="r_down">
            <wire x2="1200" y1="1056" y2="1056" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="1168" y="1056" name="r_down" orien="R180" />
        <iomarker fontsize="28" x="1136" y="992" name="r_up" orien="R180" />
        <iomarker fontsize="28" x="1136" y="864" name="l_up" orien="R180" />
        <branch name="start">
            <wire x2="1200" y1="1120" y2="1120" x1="1168" />
        </branch>
        <iomarker fontsize="28" x="1168" y="1120" name="start" orien="R180" />
    </sheet>
</drawing>