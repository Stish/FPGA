<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK" />
        <signal name="RXD" />
        <signal name="RESET" />
        <signal name="FLAG_R" />
        <signal name="LED(7:0)" />
        <signal name="XLXN_4(7:0)" />
        <signal name="FLAG_T" />
        <signal name="TXD" />
        <signal name="bit_clk" />
        <signal name="XLXN_14(7:0)" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19(7:0)" />
        <signal name="XLXN_20(7:0)" />
        <signal name="XLXN_21(7:0)" />
        <signal name="XLXN_23" />
        <signal name="XLXN_26(7:0)" />
        <signal name="XLXN_27(7:0)" />
        <signal name="XLXN_28" />
        <signal name="XLXN_30" />
        <signal name="ENA" />
        <signal name="RS" />
        <signal name="DATA(7:0)" />
        <signal name="CLK_1000Hz" />
        <signal name="XLXN_36" />
        <signal name="XLXN_37" />
        <signal name="XLXN_38(7:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="RXD" />
        <port polarity="Input" name="RESET" />
        <port polarity="BiDirectional" name="FLAG_R" />
        <port polarity="Output" name="LED(7:0)" />
        <port polarity="BiDirectional" name="FLAG_T" />
        <port polarity="Output" name="TXD" />
        <port polarity="Output" name="bit_clk" />
        <port polarity="Output" name="ENA" />
        <port polarity="Output" name="RS" />
        <port polarity="Output" name="DATA(7:0)" />
        <port polarity="BiDirectional" name="CLK_1000Hz" />
        <blockdef name="receiver">
            <timestamp>2011-6-9T20:28:30</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="transmitter">
            <timestamp>2011-6-9T19:26:45</timestamp>
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="256" x="64" y="-256" height="384" />
        </blockdef>
        <blockdef name="Test_Data_out">
            <timestamp>2011-6-26T12:29:18</timestamp>
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="0" y="148" height="24" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <rect width="64" x="320" y="212" height="24" />
            <line x2="384" y1="224" y2="224" x1="320" />
            <rect width="64" x="320" y="276" height="24" />
            <line x2="384" y1="288" y2="288" x1="320" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-64" height="384" />
        </blockdef>
        <blockdef name="LCD_Controller">
            <timestamp>2011-6-26T12:28:34</timestamp>
            <line x2="448" y1="32" y2="32" x1="384" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <rect width="320" x="64" y="-192" height="256" />
        </blockdef>
        <blockdef name="RAM">
            <timestamp>2011-6-23T6:49:7</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="400" y="-300" height="24" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <rect width="336" x="64" y="-320" height="384" />
        </blockdef>
        <block symbolname="receiver" name="XLXI_4">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="RXD" name="RXD" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="FLAG_R" name="FLAG_R" />
            <blockpin signalname="LED(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="transmitter" name="XLXI_5">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="XLXN_4(7:0)" name="DATA_IN(7:0)" />
            <blockpin signalname="FLAG_T" name="FLAG_T" />
            <blockpin signalname="TXD" name="TXD" />
            <blockpin signalname="bit_clk" name="bit_clk" />
        </block>
        <block symbolname="Test_Data_out" name="XLXI_6">
            <blockpin signalname="FLAG_T" name="FLAG_T" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_4(7:0)" name="DATA_OUT(7:0)" />
            <blockpin signalname="FLAG_R" name="FLAG_R" />
            <blockpin signalname="LED(7:0)" name="DATA_IN(7:0)" />
            <blockpin signalname="XLXN_17" name="RD_RAM" />
            <blockpin signalname="XLXN_18" name="WRT_RAM" />
            <blockpin signalname="XLXN_20(7:0)" name="RAM_OUT(7:0)" />
            <blockpin signalname="XLXN_19(7:0)" name="RAM_ADDRESS(7:0)" />
        </block>
        <block symbolname="RAM" name="XLXI_9">
            <blockpin signalname="XLXN_17" name="RD" />
            <blockpin signalname="XLXN_18" name="WRT" />
            <blockpin signalname="XLXN_20(7:0)" name="DATA_IN(7:0)" />
            <blockpin signalname="XLXN_19(7:0)" name="ADDRESS(7:0)" />
            <blockpin signalname="XLXN_38(7:0)" name="DATA_OUT(7:0)" />
            <blockpin signalname="CLK" name="CLK" />
        </block>
        <block symbolname="LCD_Controller" name="XLXI_8">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="XLXN_38(7:0)" name="DATA_IN(7:0)" />
            <blockpin signalname="CLK_1000Hz" name="CLK_1000Hz" />
            <blockpin signalname="ENA" name="ENABLE" />
            <blockpin signalname="RS" name="RS" />
            <blockpin signalname="DATA(7:0)" name="DATA_OUT(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1056" y="1568" name="XLXI_4" orien="R0">
        </instance>
        <branch name="RXD">
            <wire x2="1056" y1="1472" y2="1472" x1="1024" />
        </branch>
        <iomarker fontsize="28" x="1024" y="1472" name="RXD" orien="R180" />
        <branch name="RESET">
            <wire x2="640" y1="1536" y2="1536" x1="608" />
            <wire x2="640" y1="1536" y2="1856" x1="640" />
            <wire x2="1056" y1="1856" y2="1856" x1="640" />
            <wire x2="1056" y1="1536" y2="1536" x1="640" />
            <wire x2="2320" y1="1200" y2="1200" x1="640" />
            <wire x2="640" y1="1200" y2="1536" x1="640" />
        </branch>
        <instance x="1056" y="1952" name="XLXI_5" orien="R0">
        </instance>
        <iomarker fontsize="28" x="608" y="1536" name="RESET" orien="R180" />
        <instance x="576" y="2112" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_4(7:0)">
            <wire x2="1008" y1="2080" y2="2080" x1="960" />
            <wire x2="1008" y1="1920" y2="2080" x1="1008" />
            <wire x2="1056" y1="1920" y2="1920" x1="1008" />
        </branch>
        <iomarker fontsize="28" x="416" y="1408" name="CLK" orien="R180" />
        <branch name="FLAG_R">
            <wire x2="576" y1="2208" y2="2208" x1="544" />
            <wire x2="544" y1="2208" y2="2576" x1="544" />
            <wire x2="1664" y1="2576" y2="2576" x1="544" />
            <wire x2="1664" y1="1536" y2="1536" x1="1440" />
            <wire x2="1760" y1="1536" y2="1536" x1="1664" />
            <wire x2="1664" y1="1536" y2="2576" x1="1664" />
        </branch>
        <branch name="FLAG_T">
            <wire x2="576" y1="2144" y2="2144" x1="496" />
            <wire x2="496" y1="2144" y2="2624" x1="496" />
            <wire x2="1712" y1="2624" y2="2624" x1="496" />
            <wire x2="1712" y1="1728" y2="1728" x1="1440" />
            <wire x2="1760" y1="1728" y2="1728" x1="1712" />
            <wire x2="1712" y1="1728" y2="2624" x1="1712" />
        </branch>
        <iomarker fontsize="28" x="896" y="1792" name="TXD" orien="R180" />
        <branch name="bit_clk">
            <wire x2="1472" y1="1984" y2="1984" x1="1440" />
        </branch>
        <iomarker fontsize="28" x="1472" y="1984" name="bit_clk" orien="R0" />
        <iomarker fontsize="28" x="1760" y="1728" name="FLAG_T" orien="R0" />
        <iomarker fontsize="28" x="1616" y="1408" name="LED(7:0)" orien="R0" />
        <branch name="CLK">
            <wire x2="448" y1="1408" y2="1408" x1="416" />
            <wire x2="832" y1="1408" y2="1408" x1="448" />
            <wire x2="832" y1="1408" y2="1728" x1="832" />
            <wire x2="1056" y1="1728" y2="1728" x1="832" />
            <wire x2="1056" y1="1408" y2="1408" x1="832" />
            <wire x2="448" y1="1408" y2="2080" x1="448" />
            <wire x2="576" y1="2080" y2="2080" x1="448" />
            <wire x2="448" y1="2080" y2="2672" x1="448" />
            <wire x2="1760" y1="2672" y2="2672" x1="448" />
            <wire x2="2320" y1="1136" y2="1136" x1="448" />
            <wire x2="448" y1="1136" y2="1408" x1="448" />
            <wire x2="1760" y1="2464" y2="2672" x1="1760" />
        </branch>
        <branch name="TXD">
            <wire x2="1056" y1="1792" y2="1792" x1="896" />
        </branch>
        <iomarker fontsize="28" x="1760" y="1536" name="FLAG_R" orien="R0" />
        <branch name="XLXN_19(7:0)">
            <wire x2="1760" y1="2400" y2="2400" x1="960" />
        </branch>
        <branch name="LED(7:0)">
            <wire x2="1568" y1="1024" y2="1024" x1="288" />
            <wire x2="1568" y1="1024" y2="1408" x1="1568" />
            <wire x2="1616" y1="1408" y2="1408" x1="1568" />
            <wire x2="288" y1="1024" y2="2272" x1="288" />
            <wire x2="576" y1="2272" y2="2272" x1="288" />
            <wire x2="1568" y1="1408" y2="1408" x1="1440" />
        </branch>
        <branch name="XLXN_20(7:0)">
            <wire x2="1760" y1="2336" y2="2336" x1="960" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="1760" y1="2272" y2="2272" x1="960" />
        </branch>
        <instance x="1760" y="2432" name="XLXI_9" orien="R0">
        </instance>
        <branch name="XLXN_17">
            <wire x2="1040" y1="2208" y2="2208" x1="960" />
            <wire x2="1760" y1="2144" y2="2144" x1="1040" />
            <wire x2="1040" y1="2144" y2="2208" x1="1040" />
        </branch>
        <branch name="ENA">
            <wire x2="2800" y1="1136" y2="1136" x1="2768" />
        </branch>
        <branch name="RS">
            <wire x2="2800" y1="1200" y2="1200" x1="2768" />
        </branch>
        <branch name="DATA(7:0)">
            <wire x2="2800" y1="1264" y2="1264" x1="2768" />
        </branch>
        <branch name="CLK_1000Hz">
            <wire x2="2800" y1="1328" y2="1328" x1="2768" />
        </branch>
        <instance x="2320" y="1296" name="XLXI_8" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2800" y="1136" name="ENA" orien="R0" />
        <iomarker fontsize="28" x="2800" y="1200" name="RS" orien="R0" />
        <iomarker fontsize="28" x="2800" y="1264" name="DATA(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2800" y="1328" name="CLK_1000Hz" orien="R0" />
        <branch name="XLXN_38(7:0)">
            <wire x2="2256" y1="2144" y2="2144" x1="2224" />
            <wire x2="2320" y1="1264" y2="1264" x1="2256" />
            <wire x2="2256" y1="1264" y2="2144" x1="2256" />
        </branch>
    </sheet>
</drawing>