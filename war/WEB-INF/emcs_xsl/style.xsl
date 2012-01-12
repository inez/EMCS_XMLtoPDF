<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" 
 xmlns:svg="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">

	<xsl:attribute-set name="strona-uklad-A4">
		<xsl:attribute name="master-name">single</xsl:attribute>
		<xsl:attribute name="page-height">29.7cm</xsl:attribute>
		<xsl:attribute name="page-width">21cm</xsl:attribute>
		<xsl:attribute name="margin-top">2cm</xsl:attribute>
		<xsl:attribute name="margin-bottom">1cm</xsl:attribute>
		<xsl:attribute name="margin-left">1.5cm</xsl:attribute>
		<xsl:attribute name="margin-right">1.5cm</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="czcionka-strona-naglowek">
		<xsl:attribute name="font-family">Arial</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="font-size">16pt</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="czcionka-tabela-naglowek">
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="line-height">16px</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="font-family">Arial</xsl:attribute>
		<xsl:attribute name="font-size">12pt</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="czcionka-stopka">
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="line-height">10px</xsl:attribute>
		<xsl:attribute name="vertical-align">middle</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="font-family">Arial</xsl:attribute>
		<xsl:attribute name="font-size">8pt</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="czcionka-tabela-tekst">
		<xsl:attribute name="line-height">14px</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="vertical-align">middle</xsl:attribute>
		<xsl:attribute name="font-family">Arial</xsl:attribute>
		<xsl:attribute name="font-size">9pt</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="glowna-tabela">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">0.2mm</xsl:attribute>
		<xsl:attribute name="table-layout">fixed</xsl:attribute>
		<xsl:attribute name="space-before">1cm</xsl:attribute>
		<xsl:attribute name="hyphenate">true</xsl:attribute>
		<xsl:attribute name="hyphenation-character">-</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="stopka-tabela" use-attribute-sets="czcionka-stopka">
		<xsl:attribute name="table-layout">fixed</xsl:attribute>
		<xsl:attribute name="space-before">0cm</xsl:attribute>
		<xsl:attribute name="hyphenate">true</xsl:attribute>
		<xsl:attribute name="hyphenation-character">-</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="glowna-tabela-wiersz-bialy" use-attribute-sets="czcionka-tabela-tekst">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">0.2mm</xsl:attribute>
		<xsl:attribute name="padding-end">3px</xsl:attribute>
		<xsl:attribute name="padding-start">3px</xsl:attribute>
		<xsl:attribute name="background-color" >#ffffff</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="hyphenate">true</xsl:attribute>
		<xsl:attribute name="hyphenation-character">-</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="glowna-tabela-wiersz-jasnoSzary" use-attribute-sets="czcionka-tabela-tekst">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="border-width">0.2mm</xsl:attribute>
		<xsl:attribute name="padding-end">3px</xsl:attribute>
		<xsl:attribute name="padding-start">3px</xsl:attribute>
		<xsl:attribute name="background-color" >#eeeeee</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="hyphenate">true</xsl:attribute>
		<xsl:attribute name="hyphenation-character">-</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="glowna-tabela-wiersz-jasnoSzary-normal" use-attribute-sets="czcionka-tabela-tekst">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">0.2mm</xsl:attribute>
		<xsl:attribute name="padding-end">3px</xsl:attribute>
		<xsl:attribute name="padding-start">3px</xsl:attribute>
		<xsl:attribute name="background-color" >#eeeeee</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="hyphenate">true</xsl:attribute>
		<xsl:attribute name="hyphenation-character">-</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="glowna-tabela-wiersz-szary" use-attribute-sets="czcionka-tabela-naglowek">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">0.2mm</xsl:attribute>
		<xsl:attribute name="padding-end">3px</xsl:attribute>
		<xsl:attribute name="padding-start">3px</xsl:attribute>
		<xsl:attribute name="background-color" >#cccccc</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="hyphenate">true</xsl:attribute>
		<xsl:attribute name="hyphenation-character">-</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="glowna-tabela-wiersz-pusty">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">0.2mm</xsl:attribute>
		<xsl:attribute name="line-height">2px</xsl:attribute>
		<xsl:attribute name="padding-end">3px</xsl:attribute>
		<xsl:attribute name="padding-start">3px</xsl:attribute>
		<xsl:attribute name="background-color" >#333333</xsl:attribute>
		<xsl:attribute name="hyphenate">true</xsl:attribute>
		<xsl:attribute name="hyphenation-character">-</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="glowna-tabela-naglowkowa" use-attribute-sets="czcionka-strona-naglowek">
		<xsl:attribute name="border-style">solid</xsl:attribute>
		<xsl:attribute name="border-width">0.2mm</xsl:attribute>
		<xsl:attribute name="padding-end">0px</xsl:attribute>
		<xsl:attribute name="padding-start">2px</xsl:attribute>
		<xsl:attribute name="background-color" >#ffffff</xsl:attribute>
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="hyphenate">true</xsl:attribute>
		<xsl:attribute name="hyphenation-character">-</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="strona-uklad-wnetrze">
		<xsl:attribute name="margin-top">0.1cm</xsl:attribute>
		<xsl:attribute name="margin-bottom">25mm</xsl:attribute>
		<xsl:attribute name="font-family">Arial</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="zestawienie">
		<xsl:attribute name="font-family">Arial</xsl:attribute>
		<xsl:attribute name="font-size">10pt</xsl:attribute>
	</xsl:attribute-set>
  <xsl:attribute-set name="brak-dyrektyw">
    <xsl:attribute name="border-style">solid</xsl:attribute>
    <xsl:attribute name="border-width">0.1mm</xsl:attribute>
    <xsl:attribute name="padding-end">3px</xsl:attribute>
    <xsl:attribute name="padding-start">3px</xsl:attribute>
    <xsl:attribute name="background-color" >#ffffff</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="hyphenate">true</xsl:attribute>
    <xsl:attribute name="hyphenation-character">-</xsl:attribute>
    <xsl:attribute name="line-height">14px</xsl:attribute>
    <xsl:attribute name="font-weight">normal</xsl:attribute>
    <xsl:attribute name="vertical-align">middle</xsl:attribute>
    <xsl:attribute name="font-family">Arial</xsl:attribute>
    <xsl:attribute name="font-size">7pt</xsl:attribute>
  </xsl:attribute-set>

	<xsl:template name="ukladA4">
		<fo:layout-master-set>
			<fo:simple-page-master xsl:use-attribute-sets="strona-uklad-A4 zestawienie">
				<fo:region-body xsl:use-attribute-sets="strona-uklad-wnetrze" />
				<fo:region-after extent="1cm" precedence="true" />
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:template>

	<xsl:template name="naglowek-strony">
		<xsl:param name="napisNaglowka"/>
		<fo:table xsl:use-attribute-sets="glowna-tabela-naglowkowa">
			<fo:table-column />
			<fo:table-header>
				<fo:table-row>
					<fo:table-cell xsl:use-attribute-sets="czcionka-strona-naglowek">
						<fo:block>
							<xsl:value-of select="$napisNaglowka"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-header>
			<fo:table-body>
			</fo:table-body>
		</fo:table>
	</xsl:template>

	<xsl:template name="StopkaStrony">
		<xsl:param name="napisStopki"/>
		<fo:static-content flow-name="xsl-region-after">
			<fo:table xsl:use-attribute-sets="stopka-tabela">
				<fo:table-column column-width="proportional-column-width(6)"/>
				<fo:table-column column-width="proportional-column-width(1)"/>
				<fo:table-header>
					<fo:table-row>
						<fo:table-cell>
							<fo:block text-align="left">
								<xsl:value-of select="$napisStopki"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="right">
								Strona <fo:page-number /> z	<fo:page-number-citation ref-id="last-page_{position()}" />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
				</fo:table-body>
			</fo:table>
		</fo:static-content>
	</xsl:template>
	
	<xsl:template name="label">
		<xsl:param name="stringIn" />
		<fo:inline font-weight="bold">
			<xsl:value-of select="$stringIn" />
			<xsl:text disable-output-escaping="yes">: </xsl:text> 
		</fo:inline>
	</xsl:template>

  <xsl:template name="AR1_WAR">
    <xsl:param name="stringIn" />
    <xsl:param name="stringIn2" />
    <xsl:param name="stringIn3" />
    <fo:inline>
      <xsl:value-of select="$stringIn" />
      <xsl:value-of select="$stringIn2" />
      <xsl:value-of select="$stringIn3" />
    </fo:inline>
  </xsl:template>

	<xsl:template name="formatDate">
		<xsl:param name="stringIn" />
		<xsl:if test="string($stringIn)">
			<xsl:value-of select="substring-before($stringIn,'T')" />
			<xsl:text disable-output-escaping="yes"> </xsl:text>
	                <xsl:value-of select="substring($stringIn,12,8)" />
			<xsl:text disable-output-escaping="yes"> UTC</xsl:text>
		</xsl:if>
	</xsl:template>	
</xsl:stylesheet>