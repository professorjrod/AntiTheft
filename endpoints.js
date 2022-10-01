await fetch("http://occusecure.ath.cx/auth/validation/verify_session_index", {
  credentials: "include",
  headers: {
    "User-Agent":
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0",
    Accept:
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.5",
    "Content-Type": "application/x-www-form-urlencoded",
    "Upgrade-Insecure-Requests": "1",
  },
  referrer: "http://occusecure.ath.cx/auth/session_index",
  body: "username=+&password=+",
  method: "POST",
  mode: "cors",
});
await fetch("http://occusecure.ath.cx/auth/validation/verify_session_emma", {
  credentials: "include",
  headers: {
    "User-Agent":
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0",
    Accept:
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.5",
    "Content-Type": "application/x-www-form-urlencoded",
    "Upgrade-Insecure-Requests": "1",
  },
  referrer: "http://occusecure.ath.cx/auth/session_emma",
  body: "em=emmarowlingson%40gmail.com&epass=+",
  method: "POST",
  mode: "cors",
});
await fetch(
  "http://occusecure.ath.cx/auth/validation/verify_session_personal",
  {
    credentials: "include",
    headers: {
      "User-Agent":
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0",
      Accept:
        "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
      "Accept-Language": "en-US,en;q=0.5",
      "Content-Type": "application/x-www-form-urlencoded",
      "Upgrade-Insecure-Requests": "1",
    },
    referrer: "http://occusecure.ath.cx/auth/session_personal",
    body: "fname=Emma&lname=Rowlingson&ssn=078-05-1120&dob=09%2F31%2F1943&address=31776+Lawrence+St%2C+Lebanon%2C+OR&zip=97335&phone=%28503%29-577-3620&cpin=1121",
    method: "POST",
    mode: "cors",
  }
);

await fetch("http://occusecure.ath.cx/auth/validation/verify_session_card", {
  credentials: "include",
  headers: {
    "User-Agent":
      "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101 Firefox/105.0",
    Accept:
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
    "Accept-Language": "en-US,en;q=0.5",
    "Content-Type": "application/x-www-form-urlencoded",
    "Upgrade-Insecure-Requests": "1",
  },
  referrer: "http://occusecure.ath.cx/auth/session_card",
  body: "cnum=4558+4095+7252+5062&exp=09%2F2025&cvv=867&pin=7227",
  method: "POST",
  mode: "cors",
});
