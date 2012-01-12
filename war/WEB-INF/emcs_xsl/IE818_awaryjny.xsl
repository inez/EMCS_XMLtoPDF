<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:include href="IE818_szablon.xsl" />
	<xsl:template match="//te:TraderToEMCSRequest" xmlns:te="urn:publicid:-:PL:GOV:MF:EMCS:PHASE2:TRADER-EMCS:REQUEST:V1.00">
    <xsl:for-each select="te:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="//te2:TraderToEMCSRequest" xmlns:te2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:TRADER-EMCS:REQUEST:V1.00">
    <xsl:for-each select="te2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
	<xsl:template match="ie:CD818A" xmlns:ie="http://emcs.dgtaxud.ec/v10/cd818/ie" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
        <xsl:call-template name="IE818">
            <xsl:with-param name="title">Awaryjny raport odbioru / raport wywozu stosowany przy przemieszczaniu wyrobów akcyzowych w procedurze zawieszenia poboru akcyzy</xsl:with-param>
        </xsl:call-template>
	</xsl:template>
  <xsl:template match="ie2:IE818" xmlns:ie2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:IE818:V1.51" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <xsl:call-template name="IE818_2">
      <xsl:with-param name="title">Awaryjny raport odbioru / raport wywozu stosowany przy przemieszczaniu wyrobów akcyzowych w procedurze zawieszenia poboru akcyzy</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>