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
    <div class="events-container">
      <ul class="events">
        <xsl:apply-templates select="event"/>
      </ul>
    </div>
  </xsl:template>

  <xsl:template match="event">
    <li>
      <time>
        <xsl:attribute name="datetime">
          <xsl:value-of select="@date"/>
        </xsl:attribute>
        <xsl:value-of select="@date"/>
      </time>
      <xsl:apply-templates select="action"/>
      <div class="attachments">
        <xsl:apply-templates select="references"/>
        <xsl:apply-templates select="tags"/>
      </div>
    </li>
  </xsl:template>

  <xsl:template match="action">
    <h3 class="action"><xsl:value-of select="."/></h3>
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
