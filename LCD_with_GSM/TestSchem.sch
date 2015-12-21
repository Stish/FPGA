<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="RXD" />
        <signal name="RESET" />
        <signal name="XLXN_4(7:0)" />
        <signal name="FLAG_R" />
        <signal name="FLAG_T" />
        <signal name="bit_clk" />
        <signal name="CLK" />
        <signal name="TXD" />
        <signal name="XLXN_19(7:0)" />
        <signal name="LED(7:0)" />
        <signal name="XLXN_20(7:0)" />
        <signal name="XLXN_18" />
        <signal name="ENA" />
        <signal name="RS" />
        <signal name="DATA(7:0)" />
        <signal name="CLK_1000Hz" />
        <signal name="XLXN_38(7:0)" />
        <signal name="XLXN_64(7:0)" />
        <signal name="XLXN_65" />
        <port polarity="Input" name="RXD" />
        <port polarity="Input" name="RESET" />
        <port polarity="BiDirectional" name="FLAG_R" />
        <port polarity="BiDirectional" name="FLAG_T" />
        <port polarity="Output" name="bit_clk" />
        <port polarity="Input" name="CLK" />
        <port polarity="Output" name="TXD" />
        <port polarity="Output" name="LED(7:0)" />
        <port polarity="Output" name="ENA" />
        <port polarity="Output" name="RS" />
        <port polarity="Output" name="DATA(7:0)" />
        <port polarity="BiDirectional" name="CLK_1000Hz" />
        <blockdef name="receiver">
            <timestamp>2011-6-29T8:50:21</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="transmitter">
            <timestamp>2011-6-29T8:50:26</timestamp>
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
            <timestamp>2011-6-29T8:50:32</timestamp>
            <line x2="0" y1="352" y2="352" x1="64" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="0" y="148" height="24" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <rect width="64" x="320" y="212" height="24" />
            <line x2="384" y1="224" y2="224" x1="320" />
            <rect width="64" x="320" y="276" height="24" />
            <line x2="384" y1="288" y2="288" x1="320" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-64" height="448" />
        </blockdef>
        <blockdef name="LCD_Controller">
            <timestamp>2011-6-29T8:50:36</timestamp>
            <line x2="448" y1="160" y2="160" x1="384" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="448" y1="32" y2="32" x1="384" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-160" y2="-160" x1="384" />
            <line x2="448" y1="-96" y2="-96" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <rect width="320" x="64" y="-192" height="384" />
        </blockdef>
        <blockdef name="RAM">
            <timestamp>2011-6-29T8:50:41</timestamp>
            <line x2="0" y1="160" y2="160" x1="64" />
            <rect width="64" x="0" y="276" height="24" />
            <line x2="0" y1="288" y2="288" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="400" y="-300" height="24" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <rect width="336" x="64" y="-320" height="640" />
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
            <blockpin signalname="FLAG_R" name="FLAG_R" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="LED(7:0)" name="DATA_IN(7:0)" />
            <blockpin signalname="XLXN_18" name="WRT_RAM" />
            <blockpin signalname="XLXN_4(7:0)" name="DATA_OUT(7:0)" />
            <blockpin signalname="XLXN_20(7:0)" name="RAM_OUT(7:0)" />
            <blockpin signalname="XLXN_19(7:0)" name="RAM_ADDRESS(7:0)" />
        </block>
        <block symbolname="RAM" name="XLXI_9">
            <blockpin signalname="XLXN_65" name="RD" />
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="XLXN_18" name="WRT" />
            <blockpin signalname="XLXN_20(7:0)" name="DATA_IN(7:0)" />
            <blockpin signalname="XLXN_19(7:0)" name="ADDRESS(7:0)" />
            <blockpin signalname="XLXN_64(7:0)" name="ADDRESS_OUT(7:0)" />
            <blockpin signalname="XLXN_38(7:0)" name="DATA_OUT(7:0)" />
        </block>
        <block symbolname="LCD_Controller" name="XLXI_8">
            <blockpin signalname="CLK" name="CLK" />
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="XLXN_38(7:0)" name="DATA_IN(7:0)" />
            <blockpin signalname="CLK_1000Hz" name="CLK_1000Hz" />
            <blockpin signalname="ENA" name="ENABLE" />
            <blockpin signalname="XLXN_65" name="RD_RAM" />
            <blockpin signalname="RS" name="RS" />
            <blockpin signalname="DATA(7:0)" name="DATA_OUT(7:0)" />
            <blockpin signalname="XLXN_64(7:0)" name="RAM_ADDRESS(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1072" y="880" name="XLXI_4" orien="R0">
        </instance>
        <branch name="RXD">
            <wire x2="1072" y1="784" y2="784" x1="1040" />
        </branch>
        <branch name="RESET">
            <wire x2="656" y1="1168" y2="1168" x1="352" />
            <wire x2="1072" y1="1168" y2="1168" x1="656" />
            <wire x2="352" y1="1168" y2="1776" x1="352" />
            <wire x2="592" y1="1776" y2="1776" x1="352" />
            <wire x2="352" y1="1776" y2="2000" x1="352" />
            <wire x2="1776" y1="2000" y2="2000" x1="352" />
            <wire x2="656" y1="848" y2="848" x1="624" />
            <wire x2="656" y1="848" y2="1168" x1="656" />
            <wire x2="1072" y1="848" y2="848" x1="656" />
            <wire x2="2336" y1="512" y2="512" x1="656" />
            <wire x2="656" y1="512" y2="848" x1="656" />
            <wire x2="1776" y1="1904" y2="2000" x1="1776" />
        </branch>
        <instance x="1072" y="1264" name="XLXI_5" orien="R0">
        </instance>
        <instance x="592" y="1424" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_4(7:0)">
            <wire x2="1024" y1="1392" y2="1392" x1="976" />
            <wire x2="1024" y1="1232" y2="1392" x1="1024" />
            <wire x2="1072" y1="1232" y2="1232" x1="1024" />
        </branch>
        <branch name="FLAG_R">
            <wire x2="592" y1="1520" y2="1520" x1="560" />
            <wire x2="560" y1="1520" y2="1888" x1="560" />
            <wire x2="1616" y1="1888" y2="1888" x1="560" />
            <wire x2="1616" y1="848" y2="848" x1="1456" />
            <wire x2="1616" y1="848" y2="1888" x1="1616" />
            <wire x2="1776" y1="848" y2="848" x1="1616" />
        </branch>
        <branch name="FLAG_T">
            <wire x2="592" y1="1456" y2="1456" x1="512" />
            <wire x2="512" y1="1456" y2="1936" x1="512" />
            <wire x2="1664" y1="1936" y2="1936" x1="512" />
            <wire x2="1664" y1="1040" y2="1040" x1="1456" />
            <wire x2="1664" y1="1040" y2="1936" x1="1664" />
            <wire x2="1776" y1="1040" y2="1040" x1="1664" />
        </branch>
        <branch name="bit_clk">
            <wire x2="1488" y1="1296" y2="1296" x1="1456" />
        </branch>
        <branch name="TXD">
            <wire x2="1072" y1="1104" y2="1104" x1="912" />
        </branch>
        <branch name="XLXN_19(7:0)">
            <wire x2="1776" y1="1712" y2="1712" x1="976" />
        </branch>
        <branch name="LED(7:0)">
            <wire x2="1584" y1="336" y2="336" x1="304" />
            <wire x2="1584" y1="336" y2="720" x1="1584" />
            <wire x2="1632" y1="720" y2="720" x1="1584" />
            <wire x2="304" y1="336" y2="1584" x1="304" />
            <wire x2="592" y1="1584" y2="1584" x1="304" />
            <wire x2="1584" y1="720" y2="720" x1="1456" />
        </branch>
        <branch name="XLXN_20(7:0)">
            <wire x2="1776" y1="1648" y2="1648" x1="976" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="1776" y1="1584" y2="1584" x1="976" />
        </branch>
        <instance x="1776" y="1744" name="XLXI_9" orien="R0">
        </instance>
        <branch name="ENA">
            <wire x2="2816" y1="448" y2="448" x1="2784" />
        </branch>
        <branch name="RS">
            <wire x2="2816" y1="512" y2="512" x1="2784" />
        </branch>
        <branch name="DATA(7:0)">
            <wire x2="2816" y1="576" y2="576" x1="2784" />
        </branch>
        <branch name="CLK_1000Hz">
            <wire x2="2816" y1="640" y2="640" x1="2784" />
        </branch>
        <instance x="2336" y="608" name="XLXI_8" orien="R0">
        </instance>
        <branch name="XLXN_38(7:0)">
            <wire x2="2272" y1="1456" y2="1456" x1="2240" />
            <wire x2="2336" y1="576" y2="576" x1="2272" />
            <wire x2="2272" y1="576" y2="1456" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="1040" y="784" name="RXD" orien="R180" />
        <iomarker fontsize="28" x="624" y="848" name="RESET" orien="R180" />
        <iomarker fontsize="28" x="432" y="720" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="912" y="1104" name="TXD" orien="R180" />
        <iomarker fontsize="28" x="1488" y="1296" name="bit_clk" orien="R0" />
        <iomarker fontsize="28" x="1776" y="1040" name="FLAG_T" orien="R0" />
        <iomarker fontsize="28" x="1632" y="720" name="LED(7:0)" orien="R0" />
        <iomarker fontsize="28" x="1776" y="848" name="FLAG_R" orien="R0" />
        <iomarker fontsize="28" x="2816" y="448" name="ENA" orien="R0" />
        <iomarker fontsize="28" x="2816" y="512" name="RS" orien="R0" />
        <iomarker fontsize="28" x="2816" y="576" name="DATA(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2816" y="640" name="CLK_1000Hz" orien="R0" />
        <branch name="XLXN_64(7:0)">
            <wire x2="1776" y1="2032" y2="2032" x1="1696" />
            <wire x2="1696" y1="2032" y2="2096" x1="1696" />
            <wire x2="2304" y1="2096" y2="2096" x1="1696" />
            <wire x2="2336" y1="704" y2="704" x1="2304" />
            <wire x2="2304" y1="704" y2="2096" x1="2304" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="2864" y1="1264" y2="1264" x1="1776" />
            <wire x2="1776" y1="1264" y2="1456" x1="1776" />
            <wire x2="2864" y1="768" y2="768" x1="2784" />
            <wire x2="2864" y1="768" y2="1264" x1="2864" />
        </branch>
        <branch name="CLK">
            <wire x2="464" y1="720" y2="720" x1="432" />
            <wire x2="848" y1="720" y2="720" x1="464" />
            <wire x2="848" y1="720" y2="1040" x1="848" />
            <wire x2="1072" y1="1040" y2="1040" x1="848" />
            <wire x2="1072" y1="720" y2="720" x1="848" />
            <wire x2="464" y1="720" y2="1392" x1="464" />
            <wire x2="592" y1="1392" y2="1392" x1="464" />
            <wire x2="464" y1="1392" y2="1984" x1="464" />
            <wire x2="1744" y1="1984" y2="1984" x1="464" />
            <wire x2="2336" y1="448" y2="448" x1="464" />
            <wire x2="464" y1="448" y2="720" x1="464" />
            <wire x2="1776" y1="1776" y2="1776" x1="1744" />
            <wire x2="1744" y1="1776" y2="1984" x1="1744" />
        </branch>
    </sheet>
</drawing>