{lib, ...}: let
  sshKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDAG7FcqMB3VmekSsunDI1LWdiMJrItK25Y0klffjjsd5G50Xakbd2L/zdSLLlz+UtWD/CbgZXdO399gjXPVadNoboXOiELbEhzDZqOWZ4TA9ZWzsn+JRNIgZViLqNmFNFLsesAElRFjzNryEcjwUcB1yUyMMu4WdBrVBCeqomCRNY94NvBx/8xxjg0Huldyf+VBZMx2J8rmghEjxCQs573mmLibc62XmTYlvg7RGjgdJPRPyY7VvcB0X8SbzIHocVV6cGW6iyZi8WzeXAZMpH7euFeeTP2eTFBBmaWzbh71Ep9WBGDrG6fnZXokipBlVHl9i+TWEAJtW9171COAXAPOJEm74WQrrpin0VFFLa0iNT1eFjPCsz67Ll2ykO6hAcH4KpXWXlMT1R5BgIQE1QwqA++g7npq18D0iWWr/BKP4q7YQgyapseU6Vzpp8i/GX2o7+qeuxgus2Kk49yZStxHtDs4aNJ1EMtkRqq83YiCiYvTUq18doRidfsX42g32GnA4a0yAXOvg/5IDln9Y7iVwjylVQagJjy3TcWYaPqdbTnpTp7GUNK3XOccsqZZrvwNGbe6LXjCoLWaooaQXw4dE1AoUooo9J9GDIAK0AAuXWmzGcrj+V7dULdiG9hPVpabN29/aJUpxlkP0khGhaoX8Of+NDLFgmWWy8NXCPinw== cardno:19 716 313"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDy3QrJeu3E0ai/Jx7jAZTUlFef9EG+TXqhALpl1rkb/eIZpcGjg4WqAIQ9OmmCdc7IC4SDg6zamK8yDdnRVaEX3ISk5PbALmWtc5F/AjbvylcKmMMG15GiX7W5nj1V4HAmRXN/iKZjtoHec5rxa3A4E6EH6OC8WtlnDCFpWtUxRZcT9Vx2cgpYvUA1rYyfWQQFO29wPeQY26yYiYp37jNLMgdg5tb5nym0Q5NBDwMb84hav8Lz0EhCwTHgE/vRru0Im+mmSVoIJvi+Q68+JIVwu8FzuZCrBIRdO7KqDB/Vwzo0ZZR8bKoUcy77QYI9YeNyarPVTon3xLZXqu1ENeuZnvCbJkr8OKQoQxMUkACvKpu9vyQXamLLkbnv7ZgjsrEC7kHJji4avVgv0WZmcjvzb1YZPq/bhZIPgDaI7DlnkZ0GBX/HWNHhfHT/uCcsFeMcUVaoJo6agMPRZY6PxAVW97zj4ZctmfTts+Zra4zgSrV/5ZdMfaLfVHuxYE51PnYnASqcjTGBdicAdgHiohc5BHbUa+0eJlBM1mCbZvDmQhrKpfrK/lRqBw7kwxr1lgf8JkPajvbqAj4vpkD3uYBBGUXziyYsXiB28DtHWlNQDo+5+dzZTX1wTEWSZoTp2fr3s/RU0BLJhzcOy344ywyiJm17Nub3GYjE8LgZrTJpWQ== openpgp:0xC23BC2B3"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQCv8ab8fm/nEwxjF8yhSX/t5eImtlxM+MhrRGmg+45+mVp3JN8JvhJlUxXmwK17f1y46YCwroGiUPDcQOhU5V3fVARXo/IZUEm0OFAxdErZWaPJovgQqtB1MsvjHMy7wQKfJtCoNJa8hggdjiqhx31zdOU/243qTmvpte4xasoFVlJY6OaDWjhFVVZrYDAUrvGo5Bb9PlOddZJ89DCXrXPronQu4/id5FbzT4d0qzHYMS1y93jDvzt0Kmq8OBXHcjgD3Il3tDA3DoHjno0yPoR3VwiseJmFyQdu+mHtc6rA7xStyvfTGBp1LaF0ottaBMzwYbAZLe6Ybtrp7bqY5xVqvIF1LW7UH02QzLPM+lXPIsiZVJGuprFYPKFSLWDiYeEcF18bI9IiOwA66pH/UIT6mjiDcfAw+w2QKijFlALWmL4OcMQ6vWZ1b4zIKbFHN+mibxkZvY26KkjMA6ZCkPvGVhhzHy3k89QvtKV4giaml8uOA3ZOU9JpQQqOsBXXNzvQl5g5oLPnAkdRtWRKGPiG5vk+dxSBOj9wIOTesOcFVw6sLr9qKo7KtRc0RoA4RHyXCyevLxYHZQ+nMp/zST2H+QGSw0ZhHYp9g11U+4tzFQ05TV4irSfhaaVjOimzeVdh2Gtph5JzJv3+pkbbHFTCnmH0HL+5IqCKDLQIqk2LGPLrCzG1dkUAVtiOKkMlAzSLojqNsSdpHdSybwyonJODLJBlZN5rv/+wZ2V7FYHQ3lI+MYa6c0W274hwxAUd8ff4X6hHwaJm4p++sV6kkKYKbcLecP5SdVc8mwOhivGEsoTzNRNAseVxW3s34QRDks/Eko0Fhg7IMuCQnHsUa72Y8VFc+lJCtCXUcoFF4uknueXNGMVQiS1cHUYlXmtUDtirJkvzHRbRpUTfrn+gURwKpfZ+N6Z5s9qMUU1ADug51Oa01c3trVLgWbMN5ByXi8yuO+cqWUoe0SOyrTsyFdDnukhdVBolcTsCo/+958KSFdUpZFac6i0TLhZWWqZ4+oPGmJ1wH0jPoQAre2kgdTZEMkL3r7tz5Sx4oIGykgICeSeNZhg3kYmxiJbqINYDmMq6vWcBurGK7AoMhhzJ51v95/E4GNFRYUFzfgkwXp9tqOMrunElyf61XIkw55Sc++BD1V9LcPjiOgfmd9+tvf8O5v7F6k6z6nAbuf/hG6EI8xVJIRPbHI2yOb24rryqcqckY1abLFbz5nPI8hY03mMRTiEXpfJAYKVqcDFStJOS4lJ68nQh7mQegDY2NttYLqISv0GOJ5pkbaZu0Diy+9XdPvRnCccBuuHowZ4RMnc0bUoK/PIvxyWSaXtDqcRrvZpedxgdLXgHiHacPBk9+BdV martin@idk"
  ];
in {
  services.openssh = {
    enable = true;
    ports = [22 8022];
    settings = {
      PasswordAuthentication = lib.mkDefault false;
      X11Forwarding = true;
    };
  };

  users.users = {
    root.openssh.authorizedKeys.keys = sshKeys;
  };
}
