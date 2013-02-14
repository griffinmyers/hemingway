module Hemingway

  # This is a moronic little class to generate some HTML Tags around 
  # some content. 
  class Build
    def self.tag(html_attribute, html_content=nil, options={})
      String.new.tap do |t|
        t << "<" + html_attribute
        t << " id='" + options[:id] + "'" if options[:id]
        t << " class='" + options[:class] + "'" if options[:class]
        t << " href='" + options[:href] + "'" if options[:href]
        t << ">"
        t << html_content if html_content
        t << "</" + html_attribute + ">"
      end
    end

    def self.symbol(symbol)
      latex_sym_to_html[symbol]
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
        "\\omega" =>  "&omega;"
      }
    end

  end

end