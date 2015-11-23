<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>Christian Fei's Daily Activity Log</title>
        <link rel="stylesheet" type="text/css" href="index.css" />
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="events">
    <ul class="events with-top-margin">
      <xsl:apply-templates select="event"/>
    </ul>
  </xsl:template>

  <xsl:template match="event">
    <li>
      <xsl:apply-templates select="action"/>
      <br/>
      <small>
        <xsl:value-of select="@date"/>
        <xsl:apply-templates select="references"/>
        <xsl:apply-templates select="tags"/>
      </small>
    </li>
  </xsl:template>

  <xsl:template match="action">
    <span class="action-type"><xsl:value-of select="@type"/></span>
    <span class="event-title"><xsl:value-of select="."/></span>
  </xsl:template>

  <xsl:template match="tags">
    <ul class="tags">
      <xsl:apply-templates select="tag"/>
    </ul>
  </xsl:template>

  <xsl:template match="tag">
    <li>
      <xsl:value-of select="@name"/>
    </li>
  </xsl:template>

  <xsl:template match="references">
    <ul class="references">
      <xsl:apply-templates select="reference"/>
    </ul>
  </xsl:template>

  <xsl:template match="reference">
    <li>
      <a target="_blank">
        <xsl:attribute name="href">
          <xsl:value-of select="@src"/>
        </xsl:attribute>
        <xsl:value-of select="@type"/>
      </a>
    </li>
    <xsl:if test="position() != last()">, </xsl:if>
  </xsl:template>

</xsl:stylesheet>
