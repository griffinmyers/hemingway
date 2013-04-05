module Hemingway

  # This is a moronic little class to generate some HTML Tags around
  # some content.
  class Build
    def self.tag(html_attribute, html_content=nil, options={})
      String.new.tap do |t|
        t << "<#{html_attribute}"

        options.select { |k, v| k != :close_tag }.each do |k, v|
          t << " #{k}='#{v}'"
        end

        t << ">"
        t << html_content if html_content
        t << "</#{html_attribute}>" unless options[:close_tag] == false
      end
    end

    def self.symbol(symbol)
      latex_sym_to_html[symbol]
    end

    # return the accented character or just the character if no match.
    def self.accent(character, accent)
      character_accent_to_html[character] and character_accent_to_html[character][accent] or character
    end

    private
    def self.latex_sym_to_html
      {
        "\\Gamma" =>  "&Gamma;",
        "\\Delta" =>  "&Delta;",
        "\\Theta" =>  "&Theta;",
        "\\Lambda" =>  "&Lambda;",
        "\\Xi" =>  "&Xi;",
        "\\Pi" =>  "&Pi;",
        "\\Sigma" =>  "&Sigma;",
        "\\Upsilon" =>  "&Upsilon;",
        "\\Phi" =>  "&Phi;",
        "\\Psi" =>  "&Psi;",
        "\\Omega" =>  "&Omega;",
        "\\alpha" =>  "&alpha;",
        "\\beta" =>  "&beta;",
        "\\gamma" =>  "&gamma;",
        "\\delta" =>  "&delta;",
        "\\epsilon" =>  "&epsilon;",
        "\\zeta" =>  "&zeta;",
        "\\eta" =>  "&eta;",
        "\\theta" =>  "&theta;",
        "\\iota" =>  "&iota;",
        "\\kappa" =>  "&kappa;",
        "\\lambda" =>  "&lambda;",
        "\\mu" =>  "&mu;",
        "\\nu" =>  "&nu;",
        "\\xi" =>  "&xi;",
        "\\pi" =>  "&pi;",
        "\\rho" =>  "&rho;",
        "\\varsigma" =>  "&sigmaf;",
        "\\sigma" =>  "&sigma;",
        "\\tau" =>  "&tau;",
        "\\upsilon" =>  "&upsilon;",
        "\\phi" =>  "&phi;",
        "\\chi" =>  "&chi;",
        "\\psi" =>  "&psi;",
        "\\omega" =>  "&omega;",
        "\\rightarrow" => "&rArr;"
      }
    end

    def self.character_accent_to_html
      {
        "A" => {
          "`" => "&Agrave;",
          "'" => "&Aacute;",
          "c" => "&Acirc;",
          "~" => "&Atilde;",
          '"' => "&Auml;",
          "r" => "&Aring;"
        },
        "C" => {
          "c" => "&Ccedil;"
        },
        "E" => {
          "`" => "&Egrave;",
          "'" => "&Eacute;",
          "c" => "&Ecirc;",
          '"' => "&Euml;"
        },
        "I" => {
          "`" => "&Igrave;",
          "'" => "&Iacute;",
          "c" => "&Icirc;",
          '"' => "&Iuml;"
        },
        "N" => {
          "~" => "&Ntilde;"
        },
        "O" => {
          "`" => "&Ograve;",
          "'" => "&Oacute;",
          "c" => "&Ocirc;",
          "~" => "&Otilde;",
          '"' => "&Ouml;"
        },
        "U" => {
          "`" => "&Ugrave;",
          "'" => "&Uacute;",
          "c" => "&Ucirc;",
          '"' => "&Uuml;"
        },
        "Y" => {
          "'" => "&Yacute;"
        },
        "a" => {
          "`" => "&agrave;",
          "'" => "&aacute;",
          "c" => "&acirc;",
          "~" => "&atilde;",
          '"' => "&auml;",
          "r" => "&aring;"
        },
        "c" => {
          "c" => "&ccedil;"
        },
        "e" => {
          "`" => "&egrave;",
          "'" => "&eacute;",
          "c" => "&ecirc;",
          '"' => "&euml;"
        },
        "i" => {
          "`" => "&igrave;",
          "'" => "&iacute;",
          "c" => "&icirc;",
          '"' => "&iuml;"
        },
        "n" => {
          "~" => "&ntilde;"
        },
        "o" => {
          "`" => "&ograve;",
          "'" => "&oacute;",
          "c" => "&ocirc;",
          "~" => "&otilde;",
          '"' => "&ouml;"
        },
        "u" => {
          "`" => "&ugrave;",
          "'" => "&uacute;",
          "c" => "&ucirc;",
          '"' => "&uuml;"
        },
        "y" => {
          "'" => "&yacute;",
          '"' => "&yuml;"
        }
      }
    end

  end

end