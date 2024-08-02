require 'optparse'
require 'ipaddr'
require 'socket'
require 'net/http'
require 'json'

API_KEY = 'Your-Api-Key-Here'  # Replace with your ViewDNS API key

def valid_ip?(ip)
  """
  Check if IP address is valid.

  Args:
      ip (str): The IP address to validate.

  Returns:
      bool: True if the IP address is valid, False otherwise.
  """
  begin
    IPAddr.new(ip)
    true
  rescue IPAddr::InvalidAddressError
    false
  end
end

def reverse_lookup(ip)
  """
  Perform reverse lookup.

  Args:
      ip (str): The IP address to perform reverse lookup on.

  Returns:
      str: The domain name if found, nil otherwise.
  """
  begin
    Socket.gethostbyaddr(IPAddr.new(ip).hton).first
  rescue SocketError
    nil
  end
end

def get_websites_on_server(ip)
  """
  Get websites on the same server.

  Args:
      ip (str): The IP address to find websites on the same server.

  Returns:
      Array: List of websites on the same server.
  """
  url = URI("https://api.viewdns.info/reverseip/?host=#{ip}&apikey=#{API_KEY}&output=json")
  response = Net::HTTP.get(url)
  data = JSON.parse(response)
  if data['response'] && data['response']['domains']
    data['response']['domains']
  else
    []
  end
end

def main
  """
  Parse command-line arguments and perform IP reverse lookup.
  """
  options = {}
  OptionParser.new do |opts|
    opts.banner = 'Usage: reverse_lookup.rb [options]'

    opts.on('-a', '--all', 'Print all other websites on the same server') do |v|
      options[:all] = v
    end
  end.parse!

  ips = ARGV
  if ips.empty?
    puts 'IP address(es) required. Use --help for usage information.'
    exit
  end

  ips.each do |ip|
    unless valid_ip?(ip)
      puts "[-] Invalid IP address: #{ip}"
      next
    end

    domain = reverse_lookup(ip)
    if domain
      puts "[+] IP: #{ip}, Domain: #{domain}"
      if options[:all]
        websites = get_websites_on_server(ip)
        if websites.any?
          puts "\nOther websites on the same server:"
          websites.each { |website| puts "[+] #{website}" }
          puts "\n"
        else
          puts "[-] No other websites found on the same server."
        end
      end
    else
      puts "[-] No domain found for IP: #{ip}"
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
