# Auto-generated by IDE. Changes by user will be lost!
BASEDIR =  $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        SOURCES +=  $$quote($$BASEDIR/src/applicationui.cpp) \
                 $$quote($$BASEDIR/src/main.cpp) \
                 $$quote($$BASEDIR/ParseQt_cascades/ParseJson.cpp) \
                 $$quote($$BASEDIR/ParseQt_common/Parse.cpp) \
                 $$quote($$BASEDIR/ParseQt_common/ParseError.cpp) \
                 $$quote($$BASEDIR/ParseQt_common/ParseObject.cpp) \
                 $$quote($$BASEDIR/ParseQt_common/ParseQuery.cpp) \
                 $$quote($$BASEDIR/ParseQt_common/internal/ParseManager.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/applicationui.hpp) \
                 $$quote($$BASEDIR/ParseQt_cascades/ParseJson.hpp) \
                 $$quote($$BASEDIR/ParseQt_common/Parse.hpp) \
                 $$quote($$BASEDIR/ParseQt_common/ParseError.hpp) \
                 $$quote($$BASEDIR/ParseQt_common/ParseObject.hpp) \
                 $$quote($$BASEDIR/ParseQt_common/ParseQuery.hpp) \
                 $$quote($$BASEDIR/ParseQt_common/internal/ParseManager.hpp)

    }

    CONFIG(release, debug|release) {
        SOURCES +=  $$quote($$BASEDIR/src/applicationui.cpp) \
                 $$quote($$BASEDIR/src/main.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/applicationui.hpp)

    }

}

simulator {
    CONFIG(debug, debug|release) {
        SOURCES +=  $$quote($$BASEDIR/src/applicationui.cpp) \
                 $$quote($$BASEDIR/src/main.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/applicationui.hpp)

    }

}

INCLUDEPATH +=  $$quote($$BASEDIR/ParseQt_common) \
         $$quote($$BASEDIR/ParseQt_common/internal) \
         $$quote($$BASEDIR/ParseQt_cascades) \
         $$quote($$BASEDIR/src)

CONFIG += precompile_header

PRECOMPILED_HEADER =  $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES +=  $$quote($$BASEDIR/../assets/*.qml)

}

TRANSLATIONS =  $$quote($${TARGET}.ts)

