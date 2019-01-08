@if "%{NewProjectTemplateChB}" == "NewProjectTemplateChBChecked"
CONFIG += tests

TEMPLATE = subdirs

SUBDIRS += %{ProjectName} \

tests {
    !android {
        CONFIG(debug, debug|release) {
            message("Running test suite")
            SUBDIRS += tests \
        }
    }
}
@else
@if "%{MRestAPIChB}" == "MRestAPIChBChecked"
include(milo/mrestapi/mrestapi.pri)
@endif
@if "%{MChartsChB}" == "MChartsChBChecked"
include(milo/mcharts/mcharts.pri)
@endif
@if "%{MBarcodeScannerChB}" == "MBarcodeScannerChBChecked"
include(milo/mbarcodescanner/mbarcodescanner.pri)
@endif
@if "%{MSentryChB}" == "MSentryChBChecked"
include(milo/msentry/msentry.pri)
@endif
@if "%{MLogChB}" == "MLogChBChecked"
include(milo/mlog/mlog.pri)
@endif
@if "%{MCryptoChB}" == "MCryptoChBChecked"
include(milo/mcrypto/mcrypto.pri)
@endif
@if "%{MConfigChB}" == "MConfigChBChecked"
include(milo/mconfig/mconfig.pri)
@endif
@if "%{MScriptsChB}" == "MScriptsChBChecked"
include(milo/mscripts/mscripts.pri)
@endif
@endif
