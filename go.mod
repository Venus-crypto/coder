module github.com/coder/coder/v2

go 1.22.8

// Required until a v3 of chroma is created to lazily initialize all XML files.
// None of our dependencies seem to use the registries anyways, so this
// should be fine...
// See: https://github.com/kylecarbs/chroma/commit/9e036e0631f38ef60de5ee8eec7a42e9cb7da423
replace github.com/alecthomas/chroma/v2 => github.com/kylecarbs/chroma/v2 v2.0.0-20240401211003-9e036e0631f3

// Required until https://github.com/hashicorp/terraform-config-inspect/pull/74 is merged.
replace github.com/hashicorp/terraform-config-inspect => github.com/kylecarbs/terraform-config-inspect v0.0.0-20211215004401-bbc517866b88

// Required until https://github.com/chzyer/readline/pull/198 is merged.
replace github.com/chzyer/readline => github.com/kylecarbs/readline v0.0.0-20220211054233-0d62993714c8

// Required until https://github.com/briandowns/spinner/pull/136 is merged.
replace github.com/briandowns/spinner => github.com/kylecarbs/spinner v1.18.2-0.20220329160715-20702b5af89e

// opencensus-go leaks a goroutine by default.
replace go.opencensus.io => github.com/kylecarbs/opencensus-go v0.23.1-0.20220307014935-4d0325a68f8b

// See https://github.com/kylecarbs/tview/commit/8464256e10a1e85074c7ef9c80346baa60e9ede6
replace github.com/rivo/tview => github.com/kylecarbs/tview v0.0.0-20220309202238-8464256e10a1

// glog has a single goroutine leak on start that we removed in a fork: https://github.com/coder/glog/pull/1.
replace github.com/golang/glog => github.com/coder/glog v1.0.1-0.20220322161911-7365fe7f2cd1

// kcp-go starts a goroutine in an init function that we can't stop. It was
// fixed in our fork:
// https://github.com/coder/kcp-go/commit/83c0904cec69dcf21ec10c54ea666bda18ada831
replace github.com/fatedier/kcp-go => github.com/coder/kcp-go v2.0.4-0.20220409183554-83c0904cec69+incompatible

// https://github.com/tcnksm/go-httpstat/pull/29
replace github.com/tcnksm/go-httpstat => github.com/coder/go-httpstat v0.0.0-20230801153223-321c88088322

// See https://github.com/dlclark/regexp2/issues/63
replace github.com/dlclark/regexp2 => github.com/dlclark/regexp2 v1.7.0

// There are a few minor changes we make to Tailscale that we're slowly upstreaming. Compare here:
// https://github.com/tailscale/tailscale/compare/main...coder:tailscale:main
replace tailscale.com => github.com/coder/tailscale v1.1.1-0.20241003034647-02286e537fc2

// This is replaced to include
// 1. a fix for a data race: c.f. https://github.com/tailscale/wireguard-go/pull/25
// 2. update to the latest gVisor
replace github.com/tailscale/wireguard-go => github.com/coder/wireguard-go v0.0.0-20240522052547-769cdd7f7818

// Switch to our fork that imports fixes from http://github.com/tailscale/ssh.
// See: https://github.com/coder/coder/issues/3371
//
// Note that http://github.com/tailscale/ssh has been merged into the Tailscale
// repo as tailscale.com/tempfork/gliderlabs/ssh, however, we can't replace the
// subpath and it includes changes to golang.org/x/crypto/ssh as well which
// makes importing it directly a bit messy.
replace github.com/gliderlabs/ssh => github.com/coder/ssh v0.0.0-20231128192721-70855dedb788

// Waiting on https://github.com/imulab/go-scim/pull/95 to merge.
replace github.com/imulab/go-scim/pkg/v2 => github.com/coder/go-scim/pkg/v2 v2.0.0-20230221055123-1d63c1222136

// Waiting on https://github.com/pkg/sftp/pull/567
// Fixes https://github.com/coder/coder/issues/6685
replace github.com/pkg/sftp => github.com/mafredri/sftp v1.13.6-0.20231212144145-8218e927edb0

// Adds support for a new Listener from a driver.Connector
// This lets us use rotating authentication tokens for passwords in connection strings
// which we use in the awsiamrds package.
replace github.com/lib/pq => github.com/coder/pq v1.10.5-0.20240813183442-0c420cb5a048

require (
	cdr.dev/slog v1.6.2-0.20241112041820-0ec81e6e67bb
	cloud.google.com/go/compute/metadata v0.5.2
	github.com/acarl005/stripansi v0.0.0-20180116102854-5a71ef0e047d
	github.com/adrg/xdg v0.5.0
	github.com/ammario/tlru v0.4.0
	github.com/andybalholm/brotli v1.1.0
	github.com/armon/circbuf v0.0.0-20190214190532-5111143e8da2
	github.com/awalterschulze/gographviz v2.0.3+incompatible
	github.com/aws/smithy-go v1.22.1
	github.com/bgentry/speakeasy v0.2.0
	github.com/bramvdbogaerde/go-scp v1.5.0
	github.com/briandowns/spinner v1.18.1
	github.com/cakturk/go-netstat v0.0.0-20200220111822-e5b49efee7a5
	github.com/cenkalti/backoff/v4 v4.3.0
	github.com/charmbracelet/glamour v0.8.0
	github.com/chromedp/cdproto v0.0.0-20241003230502-a4a8f7c660df
	github.com/chromedp/chromedp v0.11.0
	github.com/cli/safeexec v1.0.1
	github.com/coder/flog v1.1.0
	github.com/coder/pretty v0.0.0-20230908205945-e89ba86370e0
	github.com/coder/quartz v0.1.2
	github.com/coder/retry v1.5.1
	github.com/coder/terraform-provider-coder v1.0.2
	github.com/coder/wgtunnel v0.1.13-0.20240522110300-ade90dfb2da0
	github.com/coreos/go-oidc/v3 v3.11.0
	github.com/coreos/go-systemd v0.0.0-20191104093116-d3cd4ed1dbcf
	github.com/creack/pty v1.1.21
	github.com/dave/dst v0.27.2
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc
	github.com/elastic/go-sysinfo v1.15.0
	github.com/fatih/color v1.18.0
	github.com/fatih/structs v1.1.0
	github.com/fatih/structtag v1.2.0
	github.com/fergusstrange/embedded-postgres v1.30.0
	github.com/fullsailor/pkcs7 v0.0.0-20190404230743-d7302db945fa
	github.com/gen2brain/beeep v0.0.0-20220402123239-6a3042f4b71a
	github.com/gliderlabs/ssh v0.3.4
	github.com/go-chi/chi/v5 v5.1.0
	github.com/go-chi/cors v1.2.1
	github.com/go-chi/httprate v0.14.1
	github.com/go-chi/render v1.0.1
	github.com/go-jose/go-jose/v3 v3.0.3
	github.com/go-logr/logr v1.4.2
	github.com/go-playground/validator/v10 v10.23.0
	github.com/gofrs/flock v0.12.0
	github.com/gohugoio/hugo v0.139.4
	github.com/golang-jwt/jwt/v4 v4.5.1
	github.com/golang-migrate/migrate/v4 v4.18.1
	github.com/google/go-cmp v0.6.0
	github.com/google/go-github/v43 v43.0.1-0.20220414155304-00e42332e405
	github.com/google/uuid v1.6.0
	github.com/hashicorp/go-multierror v1.1.1
	github.com/hashicorp/go-reap v0.0.0-20170704170343-bf58d8a43e7b
	github.com/hashicorp/go-version v1.7.0
	github.com/hashicorp/hc-install v0.9.0
	github.com/hashicorp/terraform-config-inspect v0.0.0-20211115214459-90acf1ca460f
	github.com/hashicorp/terraform-json v0.24.0
	github.com/hashicorp/yamux v0.1.2
	github.com/hinshun/vt10x v0.0.0-20220301184237-5011da428d02
	github.com/imulab/go-scim/pkg/v2 v2.2.0
	github.com/jedib0t/go-pretty/v6 v6.6.0
	github.com/jmoiron/sqlx v1.4.0
	github.com/justinas/nosurf v1.1.1
	github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51
	github.com/kirsle/configdir v0.0.0-20170128060238-e45d2f54772f
	github.com/klauspost/compress v1.17.9
	github.com/lib/pq v1.10.9
	github.com/mattn/go-isatty v0.0.20
	github.com/mitchellh/go-wordwrap v1.0.1
	github.com/mitchellh/mapstructure v1.5.1-0.20231216201459-8508981c8b6c
	github.com/moby/moby v27.3.1+incompatible
	github.com/muesli/termenv v0.15.3-0.20240618155329-98d742f6907a
	github.com/open-policy-agent/opa v0.70.0
	github.com/ory/dockertest/v3 v3.11.0
	github.com/pion/udp v0.1.4
	github.com/pkg/browser v0.0.0-20240102092130-5ac0b6a4141c
	github.com/pkg/diff v0.0.0-20210226163009-20ebb0f2a09e
	github.com/pkg/sftp v1.13.6
	github.com/prometheus-community/pro-bing v0.5.0
	github.com/prometheus/client_golang v1.20.5
	github.com/prometheus/client_model v0.6.1
	github.com/prometheus/common v0.61.0
	github.com/quasilyte/go-ruleguard/dsl v0.3.21
	github.com/robfig/cron/v3 v3.0.1
	github.com/skratchdot/open-golang v0.0.0-20200116055534-eef842397966
	github.com/spf13/afero v1.11.0
	github.com/spf13/pflag v1.0.5
	github.com/sqlc-dev/pqtype v0.3.0
	github.com/stretchr/testify v1.10.0
	github.com/swaggo/http-swagger/v2 v2.0.1
	github.com/swaggo/swag v1.16.2
	github.com/tidwall/gjson v1.18.0
	github.com/u-root/u-root v0.14.0
	github.com/unrolled/secure v1.17.0
	github.com/valyala/fasthttp v1.56.0
	github.com/wagslane/go-password-validator v0.3.0
	go.mozilla.org/pkcs7 v0.9.0
	go.nhat.io/otelsql v0.14.0
	go.opentelemetry.io/otel v1.30.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.29.0
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.28.0
	go.opentelemetry.io/otel/sdk v1.30.0
	go.opentelemetry.io/otel/trace v1.30.0
	go.uber.org/atomic v1.11.0
	go.uber.org/goleak v1.3.1-0.20240429205332-517bace7cc29
	go4.org/netipx v0.0.0-20230728180743-ad4cb58a6516
	golang.org/x/crypto v0.31.0
	golang.org/x/exp v0.0.0-20240808152545-0cdaa3abc0fa
	golang.org/x/mod v0.22.0
	golang.org/x/net v0.32.0
	golang.org/x/oauth2 v0.24.0
	golang.org/x/sync v0.10.0
	golang.org/x/sys v0.28.0
	golang.org/x/term v0.27.0
	golang.org/x/text v0.21.0 // indirect
	golang.org/x/tools v0.28.0
	golang.org/x/xerrors v0.0.0-20240903120638-7835f813f4da
	google.golang.org/api v0.210.0
	google.golang.org/grpc v1.68.0
	google.golang.org/protobuf v1.35.2
	gopkg.in/DataDog/dd-trace-go.v1 v1.69.0
	gopkg.in/natefinch/lumberjack.v2 v2.2.1
	gopkg.in/yaml.v3 v3.0.1
	gvisor.dev/gvisor v0.0.0-20240509041132-65b30f7869dc
	nhooyr.io/websocket v1.8.7
	storj.io/drpc v0.0.33
	tailscale.com v1.46.1
)

require go.uber.org/mock v0.5.0

require (
	github.com/cespare/xxhash v1.1.0
	github.com/charmbracelet/bubbles v0.20.0
	github.com/charmbracelet/bubbletea v1.2.1
	github.com/charmbracelet/lipgloss v1.0.0
	github.com/coder/serpent v0.10.0
	github.com/emersion/go-sasl v0.0.0-20200509203442-7bfe0ed36a21
	github.com/emersion/go-smtp v0.21.2
	github.com/go-jose/go-jose/v4 v4.0.2
	github.com/gomarkdown/markdown v0.0.0-20240930133441-72d49d9543d8
	github.com/google/go-github/v61 v61.0.0
	github.com/mocktools/go-smtp-mock/v2 v2.4.0
	github.com/natefinch/atomic v1.0.1
	kernel.org/pub/linux/libs/security/libcap/cap v1.2.73
)

require (
	cloud.google.com/go/auth v0.11.0 // indirect
	cloud.google.com/go/auth/oauth2adapt v0.2.6 // indirect
	dario.cat/mergo v1.0.0 // indirect
	github.com/DataDog/go-libddwaf/v3 v3.4.0 // indirect
	github.com/alecthomas/chroma/v2 v2.14.0 // indirect
	github.com/atotto/clipboard v0.1.4 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1.12.0 // indirect
	github.com/charmbracelet/x/ansi v0.4.5 // indirect
	github.com/charmbracelet/x/term v0.2.0 // indirect
	github.com/eapache/queue/v2 v2.0.0-20230407133247-75960ed334e4 // indirect
	github.com/erikgeiser/coninput v0.0.0-20211004153227-1c3628e74d0f // indirect
	github.com/go-viper/mapstructure/v2 v2.0.0 // indirect
	github.com/googleapis/gax-go/v2 v2.14.0 // indirect
	github.com/hashicorp/go-plugin v1.6.1 // indirect
	github.com/hashicorp/go-retryablehttp v0.7.7 // indirect
	github.com/hashicorp/go-secure-stdlib/parseutil v0.1.7 // indirect
	github.com/hashicorp/go-secure-stdlib/strutil v0.1.2 // indirect
	github.com/hashicorp/go-sockaddr v1.0.2 // indirect
	github.com/kylelemons/godebug v1.1.0 // indirect
	github.com/mattn/go-localereader v0.0.1 // indirect
	github.com/mitchellh/go-homedir v1.1.0 // indirect
	github.com/moby/docker-image-spec v1.3.1 // indirect
	github.com/muesli/ansi v0.0.0-20230316100256-276c6243b2f6 // indirect
	github.com/muesli/cancelreader v0.2.2 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/oklog/run v1.1.0 // indirect
	github.com/pion/transport/v2 v2.2.10 // indirect
	github.com/pion/transport/v3 v3.0.7 // indirect
	github.com/ryanuber/go-glob v1.0.0 // indirect
	github.com/tdewolff/test v1.0.11-0.20240106005702-7de5f7df4739 // indirect
	github.com/vmihailenco/msgpack/v5 v5.4.1 // indirect
	github.com/vmihailenco/tagparser/v2 v2.0.0 // indirect
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.54.0 // indirect
	kernel.org/pub/linux/libs/security/libcap/psx v1.2.73 // indirect
)

require (
	cloud.google.com/go/logging v1.12.0 // indirect
	cloud.google.com/go/longrunning v0.6.2 // indirect
	filippo.io/edwards25519 v1.1.0 // indirect
	github.com/Azure/go-ansiterm v0.0.0-20230124172434-306776ec8161 // indirect
	github.com/DataDog/appsec-internal-go v1.8.0 // indirect
	github.com/DataDog/datadog-agent/pkg/obfuscate v0.48.0 // indirect
	github.com/DataDog/datadog-agent/pkg/remoteconfig/state v0.57.0 // indirect
	github.com/DataDog/datadog-go/v5 v5.3.0 // indirect
	github.com/DataDog/go-tuf v1.1.0-0.5.2 // indirect
	github.com/DataDog/gostackparse v0.7.0 // indirect
	github.com/DataDog/sketches-go v1.4.5 // indirect
	github.com/KyleBanks/depth v1.2.1 // indirect
	github.com/Microsoft/go-winio v0.6.2 // indirect
	github.com/Nvveen/Gotty v0.0.0-20120604004816-cd527374f1e5 // indirect
	github.com/OneOfOne/xxhash v1.2.8 // indirect
	github.com/ProtonMail/go-crypto v1.1.0-alpha.2 // indirect
	github.com/agext/levenshtein v1.2.3 // indirect
	github.com/agnivade/levenshtein v1.2.0 // indirect
	github.com/akutz/memconn v0.1.0 // indirect
	github.com/alexbrainman/sspi v0.0.0-20210105120005-909beea2cc74 // indirect
	github.com/anmitsu/go-shlex v0.0.0-20200514113438-38f4b401e2be // indirect
	github.com/apparentlymart/go-textseg/v15 v15.0.0 // indirect
	github.com/armon/go-radix v1.0.1-0.20221118154546-54df44f2176c // indirect
	github.com/aws/aws-sdk-go-v2 v1.32.6
	github.com/aws/aws-sdk-go-v2/config v1.28.0
	github.com/aws/aws-sdk-go-v2/credentials v1.17.41 // indirect
	github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.16.17 // indirect
	github.com/aws/aws-sdk-go-v2/feature/rds/auth v1.5.1
	github.com/aws/aws-sdk-go-v2/internal/configsources v1.3.23 // indirect
	github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.6.23 // indirect
	github.com/aws/aws-sdk-go-v2/internal/ini v1.8.1 // indirect
	github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.12.2 // indirect
	github.com/aws/aws-sdk-go-v2/service/ssm v1.52.4 // indirect
	github.com/aws/aws-sdk-go-v2/service/sso v1.24.2 // indirect
	github.com/aws/aws-sdk-go-v2/service/ssooidc v1.28.2 // indirect
	github.com/aws/aws-sdk-go-v2/service/sts v1.32.2 // indirect
	github.com/aymanbagabas/go-osc52/v2 v2.0.1 // indirect
	github.com/aymerick/douceur v0.2.0 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/bep/godartsass/v2 v2.3.2 // indirect
	github.com/bep/golibsass v1.2.0 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/chromedp/sysutil v1.0.0 // indirect
	github.com/clbanning/mxj/v2 v2.7.0 // indirect
	github.com/cloudflare/circl v1.3.7 // indirect
	github.com/containerd/continuity v0.4.3 // indirect
	github.com/coreos/go-iptables v0.6.0 // indirect
	github.com/dlclark/regexp2 v1.11.0 // indirect
	github.com/docker/cli v27.1.1+incompatible // indirect
	github.com/docker/docker v27.2.0+incompatible // indirect
	github.com/docker/go-connections v0.5.0 // indirect
	github.com/docker/go-units v0.5.0 // indirect
	github.com/dustin/go-humanize v1.0.1
	github.com/ebitengine/purego v0.6.0-alpha.5 // indirect
	github.com/elastic/go-windows v1.0.0 // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/fxamacker/cbor/v2 v2.4.0 // indirect
	github.com/gabriel-vasile/mimetype v1.4.3 // indirect
	github.com/go-chi/hostrouter v0.2.0 // indirect
	github.com/go-ini/ini v1.67.0 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/go-ole/go-ole v1.2.6 // indirect
	github.com/go-openapi/jsonpointer v0.20.2 // indirect
	github.com/go-openapi/jsonreference v0.20.2 // indirect
	github.com/go-openapi/spec v0.20.6 // indirect
	github.com/go-openapi/swag v0.22.8 // indirect
	github.com/go-playground/locales v0.14.1 // indirect
	github.com/go-playground/universal-translator v0.18.1 // indirect
	github.com/go-test/deep v1.0.8 // indirect
	github.com/go-toast/toast v0.0.0-20190211030409-01e6764cf0a4 // indirect
	github.com/gobwas/glob v0.2.3 // indirect
	github.com/gobwas/httphead v0.1.0 // indirect
	github.com/gobwas/pool v0.2.1 // indirect
	github.com/gobwas/ws v1.4.0 // indirect
	github.com/godbus/dbus/v5 v5.1.0 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/google/btree v1.1.2 // indirect
	github.com/google/flatbuffers v23.1.21+incompatible // indirect
	github.com/google/go-querystring v1.1.0 // indirect
	github.com/google/nftables v0.2.0 // indirect
	github.com/google/pprof v0.0.0-20230817174616-7a8ec2ada47b // indirect
	github.com/google/s2a-go v0.1.8 // indirect
	github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510 // indirect
	github.com/googleapis/enterprise-certificate-proxy v0.3.4 // indirect
	github.com/gorilla/css v1.0.1 // indirect
	github.com/gorilla/mux v1.8.1 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.20.0 // indirect
	github.com/hashicorp/errwrap v1.1.0 // indirect
	github.com/hashicorp/go-cleanhttp v0.5.2 // indirect
	github.com/hashicorp/go-cty v1.4.1-0.20200414143053-d3edf31b6320 // indirect
	github.com/hashicorp/go-hclog v1.6.3 // indirect
	github.com/hashicorp/go-terraform-address v0.0.0-20240523040243-ccea9d309e0c
	github.com/hashicorp/go-uuid v1.0.3 // indirect
	github.com/hashicorp/hcl v1.0.1-vault-5 // indirect
	github.com/hashicorp/hcl/v2 v2.23.0
	github.com/hashicorp/logutils v1.0.0 // indirect
	github.com/hashicorp/terraform-plugin-go v0.23.0 // indirect
	github.com/hashicorp/terraform-plugin-log v0.9.0 // indirect
	github.com/hashicorp/terraform-plugin-sdk/v2 v2.34.0 // indirect
	github.com/hdevalence/ed25519consensus v0.1.0 // indirect
	github.com/illarion/gonotify v1.0.1 // indirect
	github.com/insomniacslk/dhcp v0.0.0-20231206064809-8c70d406f6d2 // indirect
	github.com/jmespath/go-jmespath v0.4.0 // indirect
	github.com/josharian/intern v1.0.0 // indirect
	github.com/josharian/native v1.1.1-0.20230202152459-5c7d0dd6ab86 // indirect
	github.com/jsimonetti/rtnetlink v1.3.5 // indirect
	github.com/kortschak/wol v0.0.0-20200729010619-da482cc4850a // indirect
	github.com/kr/fs v0.1.0 // indirect
	github.com/leodido/go-urn v1.4.0 // indirect
	github.com/lucasb-eyer/go-colorful v1.2.0 // indirect
	github.com/mailru/easyjson v0.7.7 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-runewidth v0.0.16 // indirect
	github.com/mdlayher/genetlink v1.3.2 // indirect
	github.com/mdlayher/netlink v1.7.2 // indirect
	github.com/mdlayher/sdnotify v1.0.0 // indirect
	github.com/mdlayher/socket v0.5.0 // indirect
	github.com/microcosm-cc/bluemonday v1.0.27 // indirect
	github.com/miekg/dns v1.1.57 // indirect
	github.com/mitchellh/copystructure v1.2.0 // indirect
	github.com/mitchellh/go-ps v1.0.0 // indirect
	github.com/mitchellh/go-testing-interface v1.14.1 // indirect
	github.com/mitchellh/reflectwalk v1.0.2 // indirect
	github.com/moby/term v0.5.0 // indirect
	github.com/muesli/reflow v0.3.0 // indirect
	github.com/niklasfasching/go-org v1.7.0 // indirect
	github.com/nu7hatch/gouuid v0.0.0-20131221200532-179d4d0c4d8d // indirect
	github.com/opencontainers/go-digest v1.0.0 // indirect
	github.com/opencontainers/image-spec v1.1.0 // indirect
	github.com/opencontainers/runc v1.1.14 // indirect
	github.com/outcaste-io/ristretto v0.2.3 // indirect
	github.com/pelletier/go-toml/v2 v2.2.3 // indirect
	github.com/philhofer/fwd v1.1.3-0.20240612014219-fbbf4953d986 // indirect
	github.com/pierrec/lz4/v4 v4.1.18 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/prometheus/procfs v0.15.1 // indirect
	github.com/rcrowley/go-metrics v0.0.0-20201227073835-cf1acfcdf475 // indirect
	github.com/riandyrn/otelchi v0.5.1 // indirect
	github.com/richardartoul/molecule v1.0.1-0.20240531184615-7ca0df43c0b3 // indirect
	github.com/rivo/uniseg v0.4.7 // indirect
	github.com/satori/go.uuid v1.2.1-0.20181028125025-b2ce2384e17b // indirect
	github.com/secure-systems-lab/go-securesystemslib v0.7.0 // indirect
	github.com/sirupsen/logrus v1.9.3 // indirect
	github.com/spaolacci/murmur3 v1.1.0 // indirect
	github.com/spf13/cast v1.7.0 // indirect
	github.com/swaggo/files/v2 v2.0.0 // indirect
	github.com/tadvi/systray v0.0.0-20190226123456-11a2b8fa57af // indirect
	github.com/tailscale/certstore v0.1.1-0.20220316223106-78d6e1c49d8d // indirect
	github.com/tailscale/golang-x-crypto v0.0.0-20230713185742-f0b76a10a08e // indirect
	github.com/tailscale/goupnp v1.0.1-0.20210804011211-c64d0f06ea05 // indirect
	github.com/tailscale/netlink v1.1.1-0.20211101221916-cabfb018fe85
	github.com/tailscale/wireguard-go v0.0.0-20231121184858-cc193a0b3272
	github.com/tchap/go-patricia/v2 v2.3.1 // indirect
	github.com/tcnksm/go-httpstat v0.2.0 // indirect
	github.com/tdewolff/parse/v2 v2.7.15 // indirect
	github.com/tidwall/match v1.1.1 // indirect
	github.com/tidwall/pretty v1.2.1 // indirect
	github.com/tinylib/msgp v1.2.1 // indirect
	github.com/u-root/uio v0.0.0-20240209044354-b3d14b93376a // indirect
	github.com/vishvananda/netlink v1.2.1-beta.2 // indirect
	github.com/vishvananda/netns v0.0.4 // indirect
	github.com/vmihailenco/msgpack v4.0.4+incompatible // indirect
	github.com/x448/float16 v0.8.4 // indirect
	github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb // indirect
	github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415 // indirect
	github.com/xeipuuv/gojsonschema v1.2.0 // indirect
	github.com/xi2/xz v0.0.0-20171230120015-48954b6210f8 // indirect
	github.com/yashtewari/glob-intersection v0.2.0 // indirect
	github.com/yuin/goldmark v1.7.8 // indirect
	github.com/yuin/goldmark-emoji v1.0.4 // indirect
	github.com/zclconf/go-cty v1.15.1
	github.com/zeebo/errs v1.3.0 // indirect
	go.opencensus.io v0.24.0 // indirect
	go.opentelemetry.io/contrib v1.19.0 // indirect
	go.opentelemetry.io/otel/metric v1.30.0 // indirect
	go.opentelemetry.io/proto/otlp v1.3.1 // indirect
	go4.org/mem v0.0.0-20220726221520-4f986261bf13 // indirect
	golang.org/x/time v0.8.0 // indirect
	golang.zx2c4.com/wintun v0.0.0-20230126152724-0fa3db229ce2 // indirect
	golang.zx2c4.com/wireguard/wgctrl v0.0.0-20230429144221-925a1e7659e6 // indirect
	golang.zx2c4.com/wireguard/windows v0.5.3 // indirect
	google.golang.org/appengine v1.6.8 // indirect
	google.golang.org/genproto v0.0.0-20241118233622-e639e219e697 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20241113202542-65e8d215514f // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20241118233622-e639e219e697 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	howett.net/plist v1.0.0 // indirect
	inet.af/peercred v0.0.0-20210906144145-0893ea02156a // indirect
	sigs.k8s.io/yaml v1.4.0 // indirect
)
