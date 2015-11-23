<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Christian Fei's Daily Activity Log</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" type="text/css" href="index.css" />
      </head>
      <body>
        <xsl:apply-templates/>
        <script type="text/javascript">
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', '{{ site.google_analytics }}']);
          _gaq.push(['_trackPageview']);
          (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();
        </script>
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
        <xsl:if test="@primary">
          <xsl:attribute name="datetime">
            <xsl:value-of select="@date"/>
          </xsl:attribute>
          <xsl:value-of select="@date"/>
        </xsl:if>
      </time>
      <xsl:apply-templates select="action"/>
      <div class="attachments">
        <xsl:apply-templates select="tags"/>
        <xsl:apply-templates select="references"/>
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
